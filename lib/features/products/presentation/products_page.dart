import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Product> products = [
    Product(
      name: 'هاتف ذكي',
      category: 'إلكترونيات',
      price: 85000,
      stock: 24,
      status: 'متوفر',
    ),
    Product(
      name: 'سماعات لاسلكية',
      category: 'إلكترونيات',
      price: 12500,
      stock: 8,
      status: 'منخفض',
    ),
    Product(
      name: 'ساعة ذكية',
      category: 'إكسسوارات',
      price: 35000,
      stock: 15,
      status: 'متوفر',
    ),
    Product(
      name: 'شاحن سريع',
      category: 'إكسسوارات',
      price: 7500,
      stock: 3,
      status: 'منخفض',
    ),
  ];

  String searchQuery = '';

  List<Product> get filteredProducts {
    if (searchQuery.trim().isEmpty) {
      return products;
    }

    return products
        .where(
          (product) =>
      product.name.contains(searchQuery) ||
          product.category.contains(searchQuery),
    )
        .toList();
  }
  Future<Product?> _showAddProductDialog() async {
    final nameController = TextEditingController();
    final categoryController = TextEditingController();
    final priceController = TextEditingController();
    final stockController = TextEditingController();

    String status = 'متوفر';

    final product = await showDialog<Product>(
      context: context,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text(
              'إضافة منتج جديد',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'اسم المنتج',
                      hintText: 'مثال: هاتف ذكي',
                      prefixIcon: Icon(Icons.inventory_2_outlined),
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      labelText: 'التصنيف',
                      hintText: 'مثال: إلكترونيات',
                      prefixIcon: Icon(Icons.category_outlined),
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'السعر',
                      hintText: 'مثال: 25000',
                      prefixIcon: Icon(Icons.payments_outlined),
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextField(
                    controller: stockController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'كمية المخزون',
                      hintText: 'مثال: 10',
                      prefixIcon: Icon(Icons.warehouse_outlined),
                    ),
                  ),
                  const SizedBox(height: 14),

                  DropdownButtonFormField<String>(
                    initialValue: status,
                    decoration: const InputDecoration(
                      labelText: 'حالة المنتج',
                      prefixIcon: Icon(Icons.info_outline),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'متوفر',
                        child: Text('متوفر'),
                      ),
                      DropdownMenuItem(
                        value: 'منخفض',
                        child: Text('منخفض'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        status = value;
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('إلغاء'),
              ),
              FilledButton.icon(
                onPressed: () {
                  final name = nameController.text.trim();
                  final category = categoryController.text.trim();
                  final price =
                      double.tryParse(priceController.text.trim()) ?? 0;
                  final stock =
                      int.tryParse(stockController.text.trim()) ?? 0;

                  if (name.isEmpty ||
                      category.isEmpty ||
                      price <= 0 ||
                      stock < 0) {
                    ScaffoldMessenger.of(dialogContext).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'يرجى إدخال بيانات المنتج بشكل صحيح',
                        ),
                      ),
                    );
                    return;
                  }

                  Navigator.of(dialogContext).pop(
                    Product(
                      name: name,
                      category: category,
                      price: price,
                      stock: stock,
                      status: status,
                    ),
                  );
                },
                icon: const Icon(Icons.save_rounded),
                label: const Text('حفظ المنتج'),
              ),
            ],
          ),
        );
      },
    );

    nameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    stockController.dispose();

    return product;
  }
  Future<Product?> _showEditProductDialog(Product product) async {
    final nameController = TextEditingController(text: product.name);
    final categoryController = TextEditingController(text: product.category);
    final priceController =
    TextEditingController(text: product.price.toStringAsFixed(0));
    final stockController =
    TextEditingController(text: product.stock.toString());

    String status = product.status;

    final editedProduct = await showDialog<Product>(
      context: context,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تعديل المنتج'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'اسم المنتج',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      labelText: 'التصنيف',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'السعر',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: stockController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'كمية المخزون',
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: status,
                    decoration: const InputDecoration(
                      labelText: 'الحالة',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'متوفر',
                        child: Text('متوفر'),
                      ),
                      DropdownMenuItem(
                        value: 'منخفض',
                        child: Text('منخفض'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        status = value;
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('إلغاء'),
              ),
              FilledButton.icon(
                onPressed: () {
                  final name = nameController.text.trim();
                  final category = categoryController.text.trim();
                  final price =
                  double.tryParse(priceController.text.trim());
                  final stock =
                  int.tryParse(stockController.text.trim());

                  if (name.isEmpty ||
                      category.isEmpty ||
                      price == null ||
                      stock == null) {
                    return;
                  }

                  Navigator.of(dialogContext).pop(
                    Product(
                      name: name,
                      category: category,
                      price: price,
                      stock: stock,
                      status: status,
                    ),
                  );
                },
                icon: const Icon(Icons.save_rounded),
                label: const Text('حفظ التعديل'),
              ),
            ],
          ),
        );
      },
    );

    nameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    stockController.dispose();

    return editedProduct;
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'المنتجات',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            return SingleChildScrollView(
              padding: EdgeInsets.all(isDesktop ? 28 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isDesktop),
                  const SizedBox(height: 24),
                  _buildStatistics(isDesktop),
                  const SizedBox(height: 24),
                  _buildProductsSection(isDesktop),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDesktop) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إدارة المنتجات',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'إضافة المنتجات ومتابعة الأسعار والمخزون بسهولة',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        if (isDesktop)
          FilledButton.icon(
            onPressed: () async {
              final product = await _showAddProductDialog();

              if (product != null) {
                setState(() {
                  products.add(product);
                });
              }
            },
            icon: const Icon(Icons.add_rounded),
            label: const Text('إضافة منتج'),
            style: FilledButton.styleFrom(
              backgroundColor: AppTheme.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildStatistics(bool isDesktop) {
    final cards = [
      _StatisticData(
        title: 'إجمالي المنتجات',
        value: '${products.length}',
        icon: Icons.inventory_2_rounded,
      ),
      _StatisticData(
        title: 'المنتجات المتوفرة',
        value: '${products.where((p) => p.status == 'متوفر').length}',
        icon: Icons.check_circle_rounded,
      ),
      _StatisticData(
        title: 'مخزون منخفض',
        value: '${products.where((p) => p.status == 'منخفض').length}',
        icon: Icons.warning_amber_rounded,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 3 : 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 3.2 : 4,
      ),
      itemBuilder: (context, index) {
        final card = cards[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    card.icon,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      card.title,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      card.value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
         );
      },
    );
  }

  Widget _buildProductsSection(bool isDesktop) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'قائمة المنتجات',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: isDesktop ? 280 : 180,
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'بحث عن منتج...',
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (filteredProducts.isEmpty)
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text('لا توجد منتجات مطابقة للبحث'),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      backgroundColor:
                      AppTheme.primary.withValues(alpha: 0.1),
                      child: const Icon(
                        Icons.inventory_2_rounded,
                        color: AppTheme.primary,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${product.category} • المخزون: ${product.stock}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${product.price.toStringAsFixed(0)} ر.س',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              product.status,
                              style: TextStyle(
                                color: product.status == 'متوفر'
                                    ? Colors.green
                                    : Colors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          tooltip: 'تعديل المنتج',
                          icon: const Icon(Icons.edit_rounded),
                          color: AppTheme.primary,
                          onPressed: () async {
                            final editedProduct =
                            await _showEditProductDialog(product);

                            if (editedProduct != null) {
                              final productIndex = products.indexOf(product);

                              if (productIndex != -1) {
                                setState(() {
                                  products[productIndex] = editedProduct;
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String category;
  final double price;
  final int stock;
  final String status;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.status,
  });
}

class _StatisticData {
  final String title;
  final String value;
  final IconData icon;

  _StatisticData({
    required this.title,
    required this.value,
    required this.icon,
  });
}
