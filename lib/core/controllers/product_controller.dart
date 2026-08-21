import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/database_helper.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // جلب المنتجات وتحديث الواجهة تلقائياً
  void fetchProducts() async {
    try {
      isLoading(true);
      var productList = await DatabaseHelper.instance.getAllProducts();
      products.assignAll(productList);
    } finally {
      isLoading(false);
    }
  }

  // إضافة منتج جديد
  Future<void> addProduct(ProductModel product) async {
    await DatabaseHelper.instance.insertProduct(product);
    fetchProducts(); // إعادة تنشيط القائمة
  }
}