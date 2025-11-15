import 'package:flutter/material.dart';

class PackagePage extends StatelessWidget {
  final int customerId;
  final String customerName;
  const PackagePage({super.key, required this.customerId, required this.customerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Packages of $customerName')),
      body: Center(child: Text('Package page for $customerName (id: $customerId) - to be implemented')),
    );
  }
}
