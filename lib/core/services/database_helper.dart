import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('digital_ceo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // جدول المنتجات
    await db.execute('''
      CREATE TABLE products (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        stock_quantity INTEGER NOT NULL,
        category TEXT NOT NULL
      )
    ''');
  }

  // إضافة منتج
  Future<int> insertProduct(ProductModel product) async {
    final db = await instance.database;
    return await db.insert('products', product.toJson());
  }

  // جلب كافة المنتجات
  Future<List<ProductModel>> getAllProducts() async {
    final db = await instance.database;
    final result = await db.query('products');
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }
}