import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المخزون'),
      ),
      body: Center(
        child: Text(
          'المخزون',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
