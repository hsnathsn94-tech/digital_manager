import '../models/product_model.dart';
import '../models/customer_model.dart';
import '../models/order_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  // مصفوفات محلية لتخزين البيانات مؤقتاً في الذاكرة
  final List<ProductModel> _products = [];
  final List<CustomerModel> _customers = [];
  final List<OrderModel> _orders = [];

  // المنتجات
  Future<void> insertProduct(ProductModel product) async {
    _products.add(product);
  }

  Future<List<ProductModel>> getAllProducts() async {
    return _products;
  }

  // العملاء
  Future<void> insertCustomer(CustomerModel customer) async {
    _customers.add(customer);
  }

  Future<List<CustomerModel>> getAllCustomers() async {
    return _customers;
  }

  // الطلبات
  Future<void> insertOrder(OrderModel order) async {
    _orders.add(order);
  }

  Future<List<OrderModel>> getAllOrders() async {
    return _orders;
  }
}