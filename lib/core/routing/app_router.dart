import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/dashboard_page.dart';
import '../../features/products/presentation/products_page.dart';
import '../../features/orders/presentation/orders_page.dart';
import '../../features/inventory/presentation/inventory_page.dart';
import '../../features/customers/presentation/customers_page.dart';
import '../../features/finance/presentation/finance_page.dart';
import '../../features/marketing/presentation/marketing_page.dart';
import '../../features/reports/presentation/reports_page.dart';
import '../../features/employees/presentation/employees_page.dart';
import '../../features/ai/presentation/ai_page.dart';
import '../../features/settings/presentation/settings_page.dart';

class AppRouter {
  static const String dashboard = '/';
  static const String products = '/products';
  static const String orders = '/orders';
  static const String inventory = '/inventory';
  static const String customers = '/customers';
  static const String finance = '/finance';
  static const String marketing = '/marketing';
  static const String reports = '/reports';
  static const String employees = '/employees';
  static const String ai = '/ai';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes {
    return {
      dashboard: (_) => const DashboardPage(),
      products: (_) => const ProductsPage(),
      orders: (_) => const OrdersPage(),
      inventory: (_) => const InventoryPage(),
      customers: (_) => const CustomersPage(),
      finance: (_) => const FinancePage(),
      marketing: (_) => const MarketingPage(),
      reports: (_) => const ReportsPage(),
      employees: (_) => const EmployeesPage(),
      ai: (_) => const AiPage(),
      settings: (_) => const SettingsPage(),
    };
  }
}