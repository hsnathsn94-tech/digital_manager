import 'package:flutter/material.dart';

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مركز الذكاء الاصطناعي'),
      ),
      body: Center(
        child: Text(
          'مركز الذكاء الاصطناعي',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
