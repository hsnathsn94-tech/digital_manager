class ProductModel {
  final String id;
  final String name;
  final double price;
  final int stockQuantity;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stockQuantity,
    required this.category,
  });

  // تحويل من JSON (عند سحب البيانات من السيرفر أو قاعدة البيانات)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      stockQuantity: json['stock_quantity'],
      category: json['category'],
    );
  }

  // تحويل إلى JSON (عند الإرسال للسيرفر)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock_quantity': stockQuantity,
      'category': category,
    };
  }
}