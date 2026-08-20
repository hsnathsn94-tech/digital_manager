import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العملاء'),
      ),
      body: Center(
        child: Text(
          'العملاء',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
