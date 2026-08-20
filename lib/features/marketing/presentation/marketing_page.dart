import 'package:flutter/material.dart';

class MarketingPage extends StatelessWidget {
  const MarketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التسويق'),
      ),
      body: Center(
        child: Text(
          'التسويق',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
