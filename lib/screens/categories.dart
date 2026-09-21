import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class CategoryItem {
  final String title;
  final String thaiTitle;
  final String recipeCount;
  final String imageUrl;
  final IconData icon;
  final Color accentColor;

  CategoryItem({
    required this.title,
    required this.thaiTitle,
    required this.recipeCount,
    required this.imageUrl,
    required this.icon,
    required this.accentColor,
  });
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final int _currentIndex = 1; // Selected tab is Search/Categories

  final List<CategoryItem> _categories = [
    CategoryItem(
      title: 'Thai Food',
      thaiTitle: 'อาหารไทยรสเด็ด',
      recipeCount: '45 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1548946526-f69e2424cf45?w=500&q=80',
      icon: Icons.ramen_dining_rounded,
      accentColor: const Color(0xFFC62828),
    ),
    CategoryItem(
      title: 'Quick Meal',
      thaiTitle: 'เมนูจานด่วนทำง่าย',
      recipeCount: '32 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80',
      icon: Icons.timer_outlined,
      accentColor: const Color(0xFFE65100),
    ),
    CategoryItem(
      title: 'Healthy',
      thaiTitle: 'อาหารเพื่อสุขภาพ',
      recipeCount: '28 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80',
      icon: Icons.eco_rounded,
      accentColor: const Color(0xFF2E7D32),
    ),
    CategoryItem(
      title: 'Desserts',
      thaiTitle: 'ของหวาน & เบเกอรี่',
      recipeCount: '20 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=500&q=80',
      icon: Icons.cake_outlined,
      accentColor: const Color(0xFF6A1B9A),
    ),
    CategoryItem(
      title: 'International',
      thaiTitle: 'อาหารนานาชาติ',
      recipeCount: '25 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80',
      icon: Icons.public_rounded,
      accentColor: const Color(0xFF1565C0),
    ),
    CategoryItem(
      title: 'Drinks',
      thaiTitle: 'เครื่องดื่ม & สมูทตี้',
      recipeCount: '15 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=500&q=80',
      icon: Icons.local_drink_rounded,
      accentColor: const Color(0xFFF57F17),
    ),
    CategoryItem(
      title: 'Vegetarian',
      thaiTitle: 'อาหารมังสวิรัติ',
      recipeCount: '18 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500&q=80',
      icon: Icons.grass_rounded,
      accentColor: const Color(0xFF00695C),
    ),
    CategoryItem(
      title: 'Soup & Stew',
      thaiTitle: 'ต้ม & แกงหอมกรุ่น',
      recipeCount: '22 เมนู',
      imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?w=500&q=80',
      icon: Icons.soup_kitchen_outlined,
      accentColor: const Color(0xFF4E342E),
    ),
  ];

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/community_recipes');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/favorites');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/meal_planner');
        break;
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
                'หมวดหมู่เมนูอาหาร',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'เลือกประเภทอาหารที่คุณอยากลิ้มลองในวันนี้',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),

              // Categories Visual Grid
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final item = _categories[index];
                    return _buildVisualCategoryCard(item);
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
              icon: Icon(Icons.grid_view_rounded),
              label: 'หมวดหมู่',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded),
              label: 'ชุมชน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: 'รายการโปรด',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'วางแผน',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualCategoryCard(CategoryItem item) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('กำลังเปิดหมวดหมู่ "${item.thaiTitle}" (${item.recipeCount})'),
            backgroundColor: const Color(0xFF157128),
            duration: const Duration(seconds: 1),
          ),
        );
        Navigator.pushReplacementNamed(context, '/home');
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              // Mouth-watering Background Photo
              Positioned.fill(
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: item.accentColor.withOpacity(0.2));
                  },
                ),
              ),

              // Dark Gradient Overlay for Readability
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.75),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Top Recipe Counter Badge
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item.recipeCount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Content Details Bottom Alignment
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: item.accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(item.icon, color: Colors.white, size: 16),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item.thaiTitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
