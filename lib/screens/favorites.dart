import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _currentIndex = 2; // Selected tab is Favorites

  final List<FavoriteRecipeItem> _favoriteRecipes = [
    FavoriteRecipeItem(
      title: 'ไข่เจียวมะเขือเทศ',
      time: '15 นาที',
      icon: Icons.egg_alt_rounded,
      iconBgColor: const Color(0xFFFFE0B2),
      iconColor: const Color(0xFFE65100),
    ),
    FavoriteRecipeItem(
      title: 'ข้าวผัดไข่',
      time: '15 นาที',
      icon: Icons.rice_bowl_rounded,
      iconBgColor: const Color(0xFFFFECB3),
      iconColor: const Color(0xFFFF8F00),
    ),
    FavoriteRecipeItem(
      title: 'ต้มจืดไข่น้ำ',
      time: '20 นาที',
      icon: Icons.soup_kitchen_rounded,
      iconBgColor: const Color(0xFFE0F2F1),
      iconColor: const Color(0xFF00695C),
    ),
    FavoriteRecipeItem(
      title: 'สมูทตี้กล้วย',
      time: '5 นาที',
      icon: Icons.local_drink_rounded,
      iconBgColor: const Color(0xFFFFF9C4),
      iconColor: const Color(0xFFF57F17),
    ),
    FavoriteRecipeItem(
      title: 'สปาเก็ตตี้คาโบนารา',
      time: '25 นาที',
      icon: Icons.dinner_dining_rounded,
      iconBgColor: const Color(0xFFFFCDD2),
      iconColor: const Color(0xFFC62828),
    ),
  ];

  void _onBottomNavTapped(int index) {
    if (index == _currentIndex) return;

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/categories');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/meal_planner');
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _removeFavorite(int index) {
    final removed = _favoriteRecipes[index];
    setState(() {
      _favoriteRecipes.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ลบ "${removed.title}" ออกจากรายการโปรดแล้ว'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'เลิกทำ',
          onPressed: () {
            setState(() {
              _favoriteRecipes.insert(index, removed);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        title: const Text(
          'Favorites',
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
              // Screen Header Title
              const Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 16),

              // Favorites List View
              Expanded(
                child: _favoriteRecipes.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border_rounded,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'ยังไม่มีรายการโปรด',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _favoriteRecipes.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final item = _favoriteRecipes[index];
                          return _buildFavoriteCard(item, index);
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
              icon: Icon(Icons.favorite_rounded),
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

  Widget _buildFavoriteCard(FavoriteRecipeItem item, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/recipe_detail');
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Thumbnail Container
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: item.iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item.icon,
                size: 30,
                color: item.iconColor,
              ),
            ),
            const SizedBox(width: 14),

            // Recipe Title and Cooking Time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.time,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Red Heart Action Button
            IconButton(
              icon: const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 24,
              ),
              onPressed: () => _removeFavorite(index),
              tooltip: 'ลบออกจากรายการโปรด',
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteRecipeItem {
  final String title;
  final String time;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  FavoriteRecipeItem({
    required this.title,
    required this.time,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}
