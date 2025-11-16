import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../Data/database.dart';
import 'package_page.dart';

enum SortBy { name, packages, gender }

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Customer> _customers = [];
  Map<int, int> _packageCounts = {};
  Map<int, bool> _pinnedCustomers = {}; // Track pinned customers
  String _query = '';
  SortBy _sortBy = SortBy.name;
  bool _sortAscending = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final customers = await appDb.getAllCustomers();
      final packages = await appDb.select(appDb.packages).get();

      final counts = <int, int>{};
      for (final p in packages) {
        counts[p.customerId] = (counts[p.customerId] ?? 0) + 1;
      }

      // Load pinned status from database
      final pinnedMap = <int, bool>{};
      for (final customer in customers) {
        pinnedMap[customer.id] = customer.isPinned;
      }

      setState(() {
        _customers = customers;
        _packageCounts = counts;
        _pinnedCustomers = pinnedMap;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading data: $e')),
        );
      }
    }
  }

  List<Customer> get _filteredSorted {
    final q = _query.toLowerCase();
    var list = _customers.where((c) {
      if (q.isEmpty) return true;
      final name = c.fullName.toLowerCase();
      final phone = (c.phoneNumber ?? '').toLowerCase();
      return name.contains(q) || phone.contains(q);
    }).toList();

    // Separate pinned and unpinned
    final pinned = list.where((c) => _pinnedCustomers[c.id] == true).toList();
    final unpinned = list.where((c) => _pinnedCustomers[c.id] != true).toList();

    // Sort each group
    void sortList(List<Customer> l) {
      switch (_sortBy) {
        case SortBy.name:
          l.sort((a, b) => a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()));
          break;
        case SortBy.packages:
          l.sort((a, b) => (_packageCounts[a.id] ?? 0).compareTo(_packageCounts[b.id] ?? 0));
          break;
        case SortBy.gender:
          l.sort((a, b) => a.gender.toLowerCase().compareTo(b.gender.toLowerCase()));
          break;
      }
      if (!_sortAscending) {
        l = l.reversed.toList();
      }
    }

    sortList(pinned);
    sortList(unpinned);

    return [...pinned, ...unpinned];
  }

  Future<void> _togglePin(Customer customer) async {
    setState(() {
      _pinnedCustomers[customer.id] = !(_pinnedCustomers[customer.id] ?? false);
    });
    
    final isPinned = _pinnedCustomers[customer.id] ?? false;
    
    // Save to database
    try {
      await appDb.togglePinnedCustomer(customer.id, isPinned);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ في حفظ البيانات: $e')),
        );
      }
    }
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isPinned ? 'تم تثبيت ${customer.fullName}' : 'تم إلغاء تثبيت ${customer.fullName}'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _showDeleteConfirmation(Customer customer) async {
    final res = await showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red[700], size: 28),
              const SizedBox(width: 12),
              const Text('تأكيد الحذف'),
            ],
          ),
          content: Text('هل أنت متأكد من حذف العميل "${customer.fullName}"؟\nسيتم حذف جميع بياناته المرتبطة.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('حذف'),
            ),
          ],
        ),
      ),
    );

    if (res == true && mounted) {
      try {
        await appDb.deleteCustomer(customer.id);
        await _loadData();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم حذف ${customer.fullName} بنجاح'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete customer: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _editCustomerDialog(Customer customer) async {
    final nameController = TextEditingController(text: customer.fullName);
    final phoneController = TextEditingController(text: customer.phoneNumber ?? '');
    String selectedGender = customer.gender;

    final res = await showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: 500,
            constraints: const BoxConstraints(maxHeight: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogHeader('تعديل بيانات العميل', context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildTextField('الاسم الكامل', nameController, 'أدخل الاسم الكامل'),
                        const SizedBox(height: 20),
                        _buildTextField('رقم الهاتف', phoneController, 'أدخل رقم الهاتف', 
                          keyboardType: TextInputType.phone),
                        const SizedBox(height: 20),
                        _buildGenderSelector(selectedGender, (gender) {
                          selectedGender = gender;
                        }),
                      ],
                    ),
                  ),
                ),
                _buildDialogFooter(
                  context,
                  onSave: () async {
                    final name = nameController.text.trim();
                    final phone = phoneController.text.trim();
                    
                    // Validation: all fields are required
                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى إدخال الاسم الكامل')),
                      );
                      return;
                    }
                    if (phone.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى إدخال رقم الهاتف')),
                      );
                      return;
                    }
                    if (selectedGender.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى اختيار النوع')),
                      );
                      return;
                    }
                    
                    await appDb.updateCustomer(
                      customer.id,
                      CustomersCompanion(
                        fullName: drift.Value(name),
                        gender: drift.Value(selectedGender),
                        phoneNumber: drift.Value(phone),
                      ),
                    );
                    Navigator.pop(context, true);
                  },
                  saveLabel: 'حفظ',
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (res == true) await _loadData();
  }

  Future<void> _addCustomerDialog() async {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    String selectedGender = 'male';

    final res = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 500,
              constraints: const BoxConstraints(maxHeight: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDialogHeader('إضافة عميل جديد', context),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildTextField('الاسم الكامل', nameController, 'أدخل الاسم الكامل'),
                          const SizedBox(height: 20),
                          _buildTextField('رقم الهاتف', phoneController, 'أدخل رقم الهاتف', 
                            keyboardType: TextInputType.phone),
                          const SizedBox(height: 20),
                          _buildGenderSelector(selectedGender, (gender) {
                            setDialogState(() {
                              selectedGender = gender;
                            });
                          }),
                        ],
                      ),
                    ),
                  ),
                  _buildDialogFooter(
                    context,
                    onSave: () async {
                      final name = nameController.text.trim();
                      final phone = phoneController.text.trim();
                      
                      // Validation: all fields are required
                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('يرجى إدخال الاسم الكامل')),
                        );
                        return;
                      }
                      if (phone.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('يرجى إدخال رقم الهاتف')),
                        );
                        return;
                      }
                      if (selectedGender.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('يرجى اختيار النوع')),
                        );
                        return;
                      }
                      
                      await appDb.createCustomer(
                        CustomersCompanion.insert(
                          fullName: name,
                          gender: selectedGender,
                          phoneNumber: drift.Value(phone),
                        ),
                      );
                      Navigator.pop(context, true);
                    },
                    saveLabel: 'إضافة',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (res == true) await _loadData();
  }

  Widget _buildDialogHeader(String title, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1565C0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context, false),
            icon: const Icon(Icons.close, color: Colors.white),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String hint, 
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textAlign: TextAlign.right,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintTextDirection: TextDirection.rtl,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelector(String selectedGender, Function(String) onChanged) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: const Text(
            'الجنس',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 12),
        StatefulBuilder(
          builder: (context, setDialogState) => Row(
            children: [
              Expanded(
                child: _buildGenderOption(
                  'female',
                  'أنثى',
                  Icons.female,
                  selectedGender,
                  (gender) {
                    setDialogState(() => onChanged(gender));
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildGenderOption(
                  'male',
                  'ذكر',
                  Icons.male,
                  selectedGender,
                  (gender) {
                    setDialogState(() => onChanged(gender));
                  },
                ),
              ),
            ],
          ),
        ),
      ], 
    );
  }

  Widget _buildGenderOption(String value, String label, IconData icon, 
      String selectedGender, Function(String) onTap) {
    final isSelected = selectedGender == value;
    return InkWell(
      onTap: () => onTap(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1565C0) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF1565C0) : Colors.grey[300]!,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey[600], size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogFooter(BuildContext context, {required VoidCallback onSave, required String saveLabel}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('إلغاء'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1565C0),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(saveLabel),
          ),
        ],
      ),
    );
  }

  Widget _buildSortButton(String label, SortBy sortValue, {IconData? icon, Widget? suffix}) {
    final isActive = _sortBy == sortValue;
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1565C0) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? const Color(0xFF1565C0) : Colors.grey[300]!,
            width: 1,
          ),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: const Color(0xFF1565C0).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              if (_sortBy == sortValue) {
                _sortAscending = !_sortAscending;
              } else {
                _sortBy = sortValue;
                _sortAscending = sortValue == SortBy.packages ? false : true;
              }
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: isActive ? Colors.white : Colors.black87),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : Colors.black87,
                  ),
                ),
                if (isActive) ...[
                  const SizedBox(width: 8),
                  suffix ?? Icon(
                    _sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = _filteredSorted;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'ابحث بالاسم أو رقم الهاتف',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                ),
              ),

              const SizedBox(height: 20),

              // Sorting Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildSortButton('الاسم', SortBy.name),
                    const SizedBox(width: 12),
                    _buildSortButton('الطلبات', SortBy.packages),
                    const SizedBox(width: 12),
                    _buildSortButton('الجنس', SortBy.gender, icon: Icons.wc,
                      suffix: _sortBy == SortBy.gender
                          ? Text(_sortAscending ? '♀' : '♂',
                              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold))
                          : null),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Customer Table
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : rows.isEmpty
                        ? _buildEmptyState()
                        : _buildCustomersTable(rows),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addCustomerDialog,
          backgroundColor: const Color(0xFF1565C0),
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            'إضافة عميل',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            _query.isEmpty ? 'لا يوجد عملاء' : 'لم يتم العثور على نتائج',
            style: TextStyle(fontSize: 18, color: Colors.grey[600], fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            _query.isEmpty ? 'ابدأ بإضافة عميل جديد' : 'جرب البحث بكلمات مختلفة',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomersTable(List<Customer> rows) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 24,
              horizontalMargin: 24,
              headingRowColor: WidgetStateProperty.all(Colors.grey[50]),
              headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              // Completely disable hover effects
              dataRowColor: WidgetStateProperty.all(Colors.transparent),
              columns: const [
                DataColumn(label: Text('الاسم')),
                DataColumn(label: Text('الهاتف')),
                DataColumn(label: Text('الطلبات')),
                DataColumn(label: Text('الجنس')),
                DataColumn(label: Text('')),
              ],
              rows: rows.map((c) {
                final pkgCount = _packageCounts[c.id] ?? 0;
                final isPinned = _pinnedCustomers[c.id] ?? false;
                
                return DataRow(
                  // Remove onSelectChanged to disable row selection/hover
                  color: WidgetStateProperty.all(
                    isPinned 
                        ? Colors.blue[50]?.withOpacity(0.3)
                        : Colors.white
                  ),
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          if (isPinned)
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.push_pin, size: 16, color: Colors.blue[700]),
                            ),
                          Expanded(
                            child: Text(c.fullName, style: const TextStyle(fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PackagePage(
                              customerId: c.id,
                              customerName: c.fullName,
                            ),
                          ),
                        );
                      },
                    ),
                    DataCell(
                      Text(c.phoneNumber ?? '-', style: TextStyle(color: Colors.grey[600])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PackagePage(
                              customerId: c.id,
                              customerName: c.fullName,
                            ),
                          ),
                        );
                      },
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: pkgCount > 0 ? Colors.blue[50] : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          pkgCount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: pkgCount > 0 ? Colors.blue[700] : Colors.grey[600],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PackagePage(
                              customerId: c.id,
                              customerName: c.fullName,
                            ),
                          ),
                        );
                      },
                    ),
                    DataCell(
                      Row(
                        children: [
                          Icon(
                            c.gender == 'male' ? Icons.male : Icons.female,
                            size: 18,
                            color: c.gender == 'male' ? Colors.blue : Colors.pink,
                          ),
                          const SizedBox(width: 4),
                          Text(c.gender == 'male' ? 'ذكر' : 'أنثى'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PackagePage(
                              customerId: c.id,
                              customerName: c.fullName,
                            ),
                          ),
                        );
                      },
                    ),
                    DataCell(
                      PopupMenuButton(
                        icon: Icon(Icons.more_vert, size: 20, color: Colors.grey[600]),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 3,
                        offset: const Offset(0, 40),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  isPinned ? Icons.push_pin_outlined : Icons.push_pin,
                                  size: 18,
                                  color: Colors.blue[700],
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  isPinned ? 'إلغاء التثبيت' : 'تثبيت',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            onTap: () => Future.delayed(
                              const Duration(milliseconds: 100),
                              () => _togglePin(c),
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.edit_outlined, size: 18, color: Colors.orange[700]),
                                const SizedBox(width: 12),
                                const Text('تعديل', style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            onTap: () => Future.delayed(
                              const Duration(milliseconds: 100),
                              () => _editCustomerDialog(c),
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline, size: 18, color: Colors.red[700]),
                                const SizedBox(width: 12),
                                Text('حذف', style: TextStyle(color: Colors.red[700], fontSize: 14)),
                              ],
                            ),
                            onTap: () => Future.delayed(
                              const Duration(milliseconds: 100),
                              () => _showDeleteConfirmation(c),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}