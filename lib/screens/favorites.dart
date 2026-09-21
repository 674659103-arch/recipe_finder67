import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class FavoriteRecipeItem {
  final String title;
  final String time;
  final String prepTime;
  final String cookTime;
  final String difficulty;
  final String calories;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  FavoriteRecipeItem({
    required this.title,
    required this.time,
    required this.prepTime,
    required this.cookTime,
    required this.difficulty,
    required this.calories,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
  });
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final int _currentIndex = 3; // Selected tab is Favorites

  final List<FavoriteRecipeItem> _favoriteRecipes = [
    FavoriteRecipeItem(
      title: 'ไข่เจียวมะเขือเทศ',
      time: '15 นาที',
      prepTime: '5 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      calories: '210 kcal',
      imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=500&q=80',
      description: 'ไข่เจียวนุ่มฟู ผสานความเปรี้ยวหวานฉ่ำของมะเขือเทศสด อร่อยทำง่าย เหมาะกับทุกมื้ออาหาร',
      ingredients: [
        'ไข่ไก่ 2 ฟอง',
        'มะเขือเทศ 1 ลูก (หั่นเต๋า)',
        'ซีอิ๊วขาว 1 ช้อนชา',
        'น้ำมันพืชสำหรับทอด 2 ช้อนโต๊ะ',
        'พริกไทยป่นเล็กน้อย',
      ],
      steps: [
        'ตอกไข่ไก่ใส่ชาม ปรุงรสด้วยซีอิ๊วขาวและพริกไทยป่น ตีให้เข้ากัน',
        'ใส่มะเขือเทศหั่นเต๋าลงไปในชามไข่ แล้วคนให้เข้ากันเบาๆ',
        'ตั้งกระทะใส่น้ำมันพืช ใช้ไฟปานกลาง รอจนน้ำมันร้อน',
        'เทไข่ใส่ลงในกระทะ ทอดจนสุกเหลืองกรอบทั้งสองด้าน ตักขึ้นพักให้สะเด็ดน้ำมันพร้อมเสิร์ฟ',
      ],
    ),
    FavoriteRecipeItem(
      title: 'ข้าวผัดไข่',
      time: '15 นาที',
      prepTime: '5 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      calories: '350 kcal',
      imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80',
      description: 'ข้าวผัดไข่หอมๆ ข้าวเรียงเม็ดสวย ปรุงรสกลมกล่อม เมนูทำง่าย อร่อยและได้ประโยชน์ครบถ้วน',
      ingredients: [
        'ข้าวสวยเย็น 1 ถ้วย',
        'ไข่ไก่ 2 ฟอง',
        'ต้นหอมซอย 1 ต้น',
        'ซีอิ๊วขาว 1 ช้อนโต๊ะ',
        'น้ำมันพืช 1 ช้อนโต๊ะ',
      ],
      steps: [
        'ตั้งกระทะใส่น้ำมันพืช ใช้ไฟปานกลาง ใส่กระเทียมสับลงผัดให้หอม',
        'ตอกไข่ไก่ลงไป ยีพอแตกแล้วผัดจนเริ่มสุกเกือบแห้ง',
        'ใส่ข้าวสวยลงไป ผัดเร็วๆ ยี้ไม่ให้ข้าวเป็นก้อน',
        'ปรุงรสด้วยซีอิ๊วขาว ผัดจนหอมกลิ่นกระทะ โรยต้นหอมซอย พร้อมเสิร์ฟ',
      ],
    ),
    FavoriteRecipeItem(
      title: 'ต้มจืดไข่น้ำ',
      time: '20 นาที',
      prepTime: '10 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      calories: '220 kcal',
      imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?w=500&q=80',
      description: 'ต้มจืดไข่น้ำซุปร้อนๆ หอมอร่อย ซดซุปลื่นคอ ได้ประโยชน์จากไข่และผักกาดขาว',
      ingredients: [
        'ไข่ไก่ 2 ฟอง',
        'หมูบด 100 กรัม',
        'ผักกาดขาว 100 กรัม',
        'น้ำซุปกระดูกหมู 500 ml',
        'ซีอิ๊วขาว 1 ช้อนโต๊ะ',
      ],
      steps: [
        'เจียวไข่ให้สุกหอม แล้วตัดเป็นชิ้นพอดีคำ พักไว้',
        'ต้มน้ำซุปให้เดือด ใส่หมูบดปั้นก้อนและผักกาดขาวลงไป',
        'ปรุงรสด้วยซีอิ๊วขาว ใส่ไข่เจียวลงไป ต้มต่อ 2 นาที พร้อมเสิร์ฟ',
      ],
    ),
    FavoriteRecipeItem(
      title: 'สมูทตี้กล้วย',
      time: '6 นาที',
      prepTime: '5 นาที',
      cookTime: '1 นาที',
      difficulty: 'ง่ายมาก',
      calories: '180 kcal',
      imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=500&q=80',
      description: 'สมูทตี้กล้วยหอมเนียนนุ่ม หอมหวานธรรมชาติจากกล้วยหอมและนมสด เติมพลังยามเช้า',
      ingredients: [
        'กล้วยหอมแช่เย็น 1 ลูก',
        'นมสด 150 ml',
        'โยเกิร์ต 2 ช้อนโต๊ะ',
        'น้ำผึ้ง 1 ช้อนชา',
      ],
      steps: [
        'ใส่กล้วยหอม นมสด โยเกิร์ต และน้ำผึ้งลงในเครื่องปั่น',
        'ปั่นจนเนื้อเนียนละเอียดเข้ากันดี เทใส่แก้วพร้อมดื่ม',
      ],
    ),
    FavoriteRecipeItem(
      title: 'สปาเก็ตตี้คาโบนารา',
      time: '25 นาที',
      prepTime: '10 นาที',
      cookTime: '15 นาที',
      difficulty: 'ปานกลาง',
      calories: '480 kcal',
      imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=500&q=80',
      description: 'สปาเก็ตตี้คาโบนาราครีมชีสเข้มข้น หอมเบคอนกรอบสไตล์อิตาเลียนแท้',
      ingredients: [
        'เส้นสปาเก็ตตี้ 100 กรัม',
        'เบคอนกรอบ 50 กรัม',
        'ไข่แดง 2 ฟอง',
        'พาเมซานชีสขูด 30 กรัม',
        'วิปปิ้งครีม 50 ml',
      ],
      steps: [
        'ต้มเส้นสปาเก็ตตี้ในน้ำเดือดใส่เกลือจนสุกอัลเดนเต้',
        'ทอดเบคอนจนกรอบ ตักขึ้นพักไว้',
        'ผสมไข่แดง ชีส และครีมเข้าด้วยกัน คลุกกับเส้นร้อนๆ และเบคอนกรอบ พร้อมเสิร์ฟ',
      ],
    ),
    FavoriteRecipeItem(
      title: 'สลัดอกไก่ย่าง',
      time: '20 นาที',
      prepTime: '10 นาที',
      cookTime: '10 นาที',
      difficulty: 'ปานกลาง',
      calories: '290 kcal',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80',
      description: 'สลัดอกไก่ย่างหอมๆ ผักสลัดสดกรอบ ได้โปรตีนสูง เหมาะสำหรับสายสุขภาพ',
      ingredients: [
        'อกไก่ 200 กรัม',
        'ผักสลัดคอส 100 กรัม',
        'มะเขือเทศเชอร์รี่ 5 ลูก',
        'น้ำสลัดงาญี่ปุ่น 2 ช้อนโต๊ะ',
      ],
      steps: [
        'ย่างอกไก่จนสุก หั่นชิ้นพอดีคำ',
        'จัดผักสลัดและมะเขือเทศใส่จาน วางอกไก่ ราดน้ำสลัดงาญี่ปุ่น',
      ],
    ),
  ];

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/categories');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/community_recipes');
        break;
      case 3:
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/meal_planner');
        break;
    }
  }

  void _openRecipeDetail(FavoriteRecipeItem item) {
    Navigator.pushNamed(
      context,
      '/recipe_detail',
      arguments: {
        'title': item.title,
        'prepTime': item.prepTime,
        'cookTime': item.cookTime,
        'difficulty': item.difficulty,
        'imageUrl': item.imageUrl,
        'description': item.description,
        'author': 'รายการโปรดของคุณ',
        'ingredients': item.ingredients,
        'steps': item.steps,
      },
    );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_rounded, color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${_favoriteRecipes.length} เมนู',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
              icon: Icon(Icons.grid_view_rounded),
              label: 'หมวดหมู่',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded),
              label: 'ชุมชน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
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

  Widget _buildFavoriteCard(FavoriteRecipeItem item, int index) {
    const primaryColor = Color(0xFF157128);

    return InkWell(
      onTap: () => _openRecipeDetail(item),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            // Mouth-watering Food Photo Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 68,
                height: 68,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE8F5E9),
                      child: const Icon(
                        Icons.restaurant_rounded,
                        size: 32,
                        color: primaryColor,
                      ),
                    );
                  },
                ),
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
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.calories,
                        style: TextStyle(
                          fontSize: 12,
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
                size: 22,
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
