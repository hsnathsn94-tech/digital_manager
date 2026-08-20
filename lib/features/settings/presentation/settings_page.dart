import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
      ),
      body: Center(
        child: Text(
          'الإعدادات',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
