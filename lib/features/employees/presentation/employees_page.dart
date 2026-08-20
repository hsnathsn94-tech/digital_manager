import 'package:flutter/material.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الموظفون'),
      ),
      body: Center(
        child: Text(
          'الموظفون',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
