import 'package:flutter/material.dart';

import '../../../core/routing/app_router.dart';
import '../../../core/theme/app_theme.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  final List<_MenuItem> menuItems = const [
    _MenuItem(
      title: 'لوحة التحكم',
      icon: Icons.dashboard_rounded,
      route: AppRouter.dashboard,
    ),
    _MenuItem(
      title: 'المنتجات',
      icon: Icons.inventory_2_rounded,
      route: AppRouter.products,
    ),
    _MenuItem(
      title: 'الطلبات',
      icon: Icons.shopping_cart_rounded,
      route: AppRouter.orders,
    ),
    _MenuItem(
      title: 'المخزون',
      icon: Icons.warehouse_rounded,
      route: AppRouter.inventory,
    ),
    _MenuItem(
      title: 'العملاء',
      icon: Icons.people_alt_rounded,
      route: AppRouter.customers,
    ),
    _MenuItem(
      title: 'المالية',
      icon: Icons.account_balance_wallet_rounded,
      route: AppRouter.finance,
    ),
    _MenuItem(
      title: 'التسويق',
      icon: Icons.campaign_rounded,
      route: AppRouter.marketing,
    ),
    _MenuItem(
      title: 'التقارير',
      icon: Icons.analytics_rounded,
      route: AppRouter.reports,
    ),
    _MenuItem(
      title: 'الموظفون',
      icon: Icons.badge_rounded,
      route: AppRouter.employees,
    ),
    _MenuItem(
      title: 'الذكاء الاصطناعي',
      icon: Icons.auto_awesome_rounded,
      route: AppRouter.ai,
    ),
    _MenuItem(
      title: 'الإعدادات',
      icon: Icons.settings_rounded,
      route: AppRouter.settings,
    ),
  ];

  void openPage(String route) {
    if (route == AppRouter.dashboard) {
      return;
    }

    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return Scaffold(
          appBar: _buildAppBar(isDesktop),
          drawer: isDesktop ? null : _buildDrawer(),
          body: Row(
            children: [
              if (isDesktop) _buildSidebar(),
              Expanded(
                child: _buildDashboardContent(isDesktop),
              ),
            ],
          ),
          bottomNavigationBar:
          isDesktop ? null : _buildBottomNavigation(),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDesktop) {
    return AppBar(
      title: Row(
        children: [
          if (!isDesktop)
            const Text(
              'المدير الرقمي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          else
            const Text(
              'لوحة المدير التنفيذي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'الإشعارات',
          onPressed: () {},
          icon: const Badge(
            label: Text('3'),
            child: Icon(Icons.notifications_none_rounded),
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CircleAvatar(
            backgroundColor: AppTheme.primary.withValues(alpha:.1),
            child: const Icon(
              Icons.person_rounded,
              color: AppTheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 260,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: Color(0xFFE8EAF0),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppTheme.primary,
                  child: Icon(
                    Icons.business_center_rounded,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'المدير الرقمي',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final selected = index == selectedIndex;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    selected: selected,
                    selectedTileColor:
                    AppTheme.primary.withValues(alpha:.09),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: Icon(
                      item.icon,
                      color: selected
                          ? AppTheme.primary
                          : Colors.grey.shade600,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontWeight:
                        selected ? FontWeight.bold : FontWeight.normal,
                        color: selected
                            ? AppTheme.primary
                            : Colors.grey.shade800,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      openPage(item.route);
                    },
                  ),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'الإصدار 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: _buildSidebar(),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return NavigationBar(
      selectedIndex: selectedIndex > 4 ? 0 : selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });

        openPage(menuItems[index].route);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard_rounded),
          label: 'الرئيسية',
        ),
        NavigationDestination(
          icon: Icon(Icons.inventory_2_outlined),
          selectedIcon: Icon(Icons.inventory_2_rounded),
          label: 'المنتجات',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          selectedIcon: Icon(Icons.shopping_cart_rounded),
          label: 'الطلبات',
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline_rounded),
          selectedIcon: Icon(Icons.people_alt_rounded),
          label: 'العملاء',
        ),
        NavigationDestination(
          icon: Icon(Icons.more_horiz_rounded),
          label: 'المزيد',
        ),
      ],
    );
  }

  Widget _buildDashboardContent(bool isDesktop) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isDesktop ? 28 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcome(),

          const SizedBox(height: 24),

          _buildKpis(),

          const SizedBox(height: 24),

          _buildSmartInsights(),

          const SizedBox(height: 24),

          _buildMainSections(isDesktop),
        ],
      ),
    );
  }

  Widget _buildWelcome() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            AppTheme.primary,
            AppTheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مرحبًا بك في المدير الرقمي 👋',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'نظرة تنفيذية سريعة على أداء تجارتك الإلكترونية اليوم.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKpis() {
    final cards = [
      const _KpiData(
        title: 'إجمالي المبيعات',
        value: '24,850 ر.س',
        change: '+12.5%',
        icon: Icons.trending_up_rounded,
      ),
      const _KpiData(
        title: 'الأرباح',
        value: '8,420 ر.س',
        change: '+8.3%',
        icon: Icons.account_balance_wallet_rounded,
      ),
      const _KpiData(
        title: 'الطلبات',
        value: '326',
        change: '+15.2%',
        icon: Icons.shopping_cart_rounded,
      ),
      const _KpiData(
        title: 'العملاء',
        value: '1,248',
        change: '+6.7%',
        icon: Icons.people_alt_rounded,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = width >= 1100
            ? 4
            : width >= 700
            ? 2
            : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: columns == 1 ? 3 : 1.7,
          ),
          itemBuilder: (context, index) {
            final card = cards[index];

            return _KpiCard(data: card);
          },
        );
      },
    );
  }

  Widget _buildSmartInsights() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: AppTheme.primary,
                ),
                SizedBox(width: 10),
                Text(
                  'توصيات المدير الرقمي',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _InsightTile(
              icon: Icons.warning_amber_rounded,
              title: 'تنبيه المخزون',
              description:
              '3 منتجات وصلت إلى مستوى مخزون منخفض وتحتاج إلى إعادة طلب.',
            ),
            _InsightTile(
              icon: Icons.trending_up_rounded,
              title: 'فرصة نمو',
              description:
              'المبيعات ارتفعت بنسبة 12.5% مقارنة بالفترة السابقة.',
            ),
            _InsightTile(
              icon: Icons.campaign_rounded,
              title: 'اقتراح تسويقي',
              description:
              'يوصى بإطلاق حملة للعملاء غير النشطين خلال آخر 30 يومًا.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainSections(bool isDesktop) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 850) {
          return Column(
            children: [
              _buildSalesCard(),
              const SizedBox(height: 20),
              _buildAlertsCard(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildSalesCard(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildAlertsCard(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSalesCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أداء المبيعات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 180,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  12,
                      (index) {
                    final heights = [
                      0.45,
                      0.55,
                      0.42,
                      0.68,
                      0.58,
                      0.72,
                      0.62,
                      0.82,
                      0.76,
                      0.90,
                      0.80,
                      0.95,
                    ];

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: FractionallySizedBox(
                          heightFactor: heights[index],
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withValues(alpha:.8),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('يناير'),
                Text('مارس'),
                Text('مايو'),
                Text('يوليو'),
                Text('سبتمبر'),
                Text('ديسمبر'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'التنبيهات المهمة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            _AlertTile(
              icon: Icons.inventory_2_rounded,
              title: 'مخزون منخفض',
              subtitle: '5 منتجات',
            ),
            _AlertTile(
              icon: Icons.pending_actions_rounded,
              title: 'طلبات قيد المعالجة',
              subtitle: '18 طلب',
            ),
            _AlertTile(
              icon: Icons.support_agent_rounded,
              title: 'طلبات خدمة العملاء',
              subtitle: '7 تذاكر',
            ),
            _AlertTile(
              icon: Icons.payments_rounded,
              title: 'مصروفات تحتاج مراجعة',
              subtitle: '3 عمليات',
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final String route;

  const _MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

class _KpiData {
  final String title;
  final String value;
  final String change;
  final IconData icon;

  const _KpiData({
    required this.title,
    required this.value,
    required this.change,
    required this.icon,
  });
}

class _KpiCard extends StatelessWidget {
  final _KpiData data;

  const _KpiCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha:.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                data.icon,
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.value,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.change,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _InsightTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppTheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AlertTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppTheme.primary.withValues(alpha:.1),
        child: Icon(
          icon,
          color: AppTheme.primary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.chevron_left_rounded,
      ),
    );
  }
}