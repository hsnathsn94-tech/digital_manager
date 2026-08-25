class OrderItem {
  final String productId;
  final int quantity;
  final double price;

  OrderItem({required this.productId, required this.quantity, required this.price});
  
  Map<String, dynamic> toJson() => {'product_id': productId, 'quantity': quantity, 'price': price};
}

class OrderModel {
  final String id;
  final String customerId;
  final List<OrderItem> items; // قائمة المنتجات المشتراة
  final double totalAmount;
  final String status; // (Pending, Completed, Cancelled)

  OrderModel({
    required this.id,
    required this.customerId,
    required this.items,
    required this.totalAmount,
    required this.status,
  });
}