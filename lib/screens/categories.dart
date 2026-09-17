import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _currentIndex = 1; // Selected tab is Search/Categories

  final List<CategoryItem> _categories = [
    CategoryItem(
      title: 'Healthy',
      icon: Icons.eco_rounded,
      bgColor: const Color(0xFFE8F5E9),
      accentColor: const Color(0xFF2E7D32),
    ),
    CategoryItem(
      title: 'Quick Meal',
      icon: Icons.timer_outlined,
      bgColor: const Color(0xFFFFF3E0),
      accentColor: const Color(0xFFE65100),
    ),
    CategoryItem(
      title: 'Thai',
      icon: Icons.ramen_dining_rounded,
      bgColor: const Color(0xFFFFEBEE),
      accentColor: const Color(0xFFC62828),
    ),
    CategoryItem(
      title: 'International',
      icon: Icons.public_rounded,
      bgColor: const Color(0xFFE3F2FD),
      accentColor: const Color(0xFF1565C0),
    ),
    CategoryItem(
      title: 'Vegetarian',
      icon: Icons.grass_rounded,
      bgColor: const Color(0xFFE0F2F1),
      accentColor: const Color(0xFF00695C),
    ),
    CategoryItem(
      title: 'Desserts',
      icon: Icons.cake_outlined,
      bgColor: const Color(0xFFF3E5F5),
      accentColor: const Color(0xFF6A1B9A),
    ),
    CategoryItem(
      title: 'Breakfast',
      icon: Icons.free_breakfast_outlined,
      bgColor: const Color(0xFFFFFDE7),
      accentColor: const Color(0xFFF57F17),
    ),
    CategoryItem(
      title: 'Soup',
      icon: Icons.soup_kitchen_outlined,
      bgColor: const Color(0xFFEFEBE9),
      accentColor: const Color(0xFF4E342E),
    ),
  ];

  void _onBottomNavTapped(int index) {
    if (index == _currentIndex) return;

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/favorites');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/meal_planner');
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87, size: 20),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Header
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 16),

              // Categories Grid
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final item = _categories[index];
                    return _buildCategoryCard(item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomNavTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey[500],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'ค้นหา',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: 'รายการโปรด',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'วางแผนมื้ออาหาร',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(CategoryItem item) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('คุณเลือกหมวดหมู่: ${item.title}'),
            backgroundColor: const Color(0xFF157128),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: item.bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: item.accentColor.withOpacity(0.15),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: item.accentColor.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.icon,
                size: 32,
                color: item.accentColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color accentColor;

  CategoryItem({
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.accentColor,
  });
}
