import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المنتجات'),
      ),
      body: Center(
        child: Text(
          'المنتجات',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
