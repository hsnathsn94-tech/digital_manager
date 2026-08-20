import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المالية'),
      ),
      body: Center(
        child: Text(
          'المالية',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
