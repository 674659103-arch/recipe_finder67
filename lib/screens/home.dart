import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class RecipeModel {
  final String title;
  final String time;
  final String prepTime;
  final String cookTime;
  final String difficulty;
  final String calories;
  final String category;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  RecipeModel({
    required this.title,
    required this.time,
    required this.prepTime,
    required this.cookTime,
    required this.difficulty,
    required this.calories,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = ['ไข่', 'มะเขือเทศ', 'ข้าว'];
  String _selectedCategory = 'ทั้งหมด';

  final List<String> _categories = [
    'ทั้งหมด',
    'เมนูไข่',
    'อาหารจานเดียว',
    'สุขภาพ',
    'ขนมหวาน',
    'เครื่องดื่ม',
  ];

  final List<RecipeModel> _allRecipes = [
    RecipeModel(
      title: 'ข้าวผัดไข่',
      time: '15 นาที',
      prepTime: '5 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      calories: '350 kcal',
      category: 'อาหารจานเดียว',
      imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80',
      description: 'ข้าวผัดไข่หอมๆ ข้าวเรียงเม็ดสวย ปรุงรสกลมกล่อม เมนูทำง่าย อร่อยและได้ประโยชน์ครบถ้วน',
      ingredients: [
        'ข้าวสวยเย็น 1 ถ้วย',
        'ไข่ไก่ 2 ฟอง',
        'ต้นหอมซอย 1 ต้น',
        'กระเทียมสับ 1 ช้อนชา',
        'ซีอิ๊วขาว 1 ช้อนโต๊ะ',
        'น้ำมันพืช 1 ช้อนโต๊ะ',
      ],
      steps: [
        'ตั้งกระทะใส่น้ำมันพืช ใช้ไฟปานกลาง ใส่กระเทียมสับลงผัดให้หอม',
        'ตอกไข่ไก่ลงไป ยีพอแตกแล้วผัดจนเริ่มสุกเกือบแห้ง',
        'ใส่ข้าวสวยลงไป ผัดเร็วๆ ยี้ไม่ให้ข้าวเป็นก้อน',
        'ปรุงรสด้วยซีอิ๊วขาวและพริกไทยป่น ผัดจนหอมกลิ่นกระทะ โรยต้นหอมซอย พร้อมเสิร์ฟ',
      ],
    ),
    RecipeModel(
      title: 'ไข่เจียวมะเขือเทศ',
      time: '15 นาที',
      prepTime: '5 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      calories: '210 kcal',
      category: 'เมนูไข่',
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
    RecipeModel(
      title: 'สมูทตี้กล้วย',
      time: '6 นาที',
      prepTime: '5 นาที',
      cookTime: '1 นาที',
      difficulty: 'ง่ายมาก',
      calories: '180 kcal',
      category: 'เครื่องดื่ม',
      imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=500&q=80',
      description: 'สมูทตี้กล้วยหอมเนียนนุ่ม หอมหวานธรรมชาติจากกล้วยหอมและนมสด เติมพลังและความสดชื่นยามเช้า',
      ingredients: [
        'กล้วยหอมแช่เย็น 1 ลูก',
        'นมสด 150 ml',
        'โยเกิร์ตรสธรรมชาติ 2 ช้อนโต๊ะ',
        'น้ำผึ้ง 1 ช้อนชา',
      ],
      steps: [
        'หั่นกล้วยหอมแช่เย็นเป็นชิ้นๆ',
        'ใส่กล้วยหอม นมสด โยเกิร์ต และน้ำผึ้งลงในเครื่องปั่น',
        'ปั่นด้วยความเร็วสูงจนเนื้อเนียนละเอียดเข้ากันดี',
        'เทใส่แก้ว ตกแต่งด้วยชิ้นกล้วย พร้อมดื่มทันที',
      ],
    ),
    RecipeModel(
      title: 'ผัดกะเพราหมูสับ',
      time: '12 นาที',
      prepTime: '5 นาที',
      cookTime: '7 นาที',
      difficulty: 'ง่าย',
      calories: '420 kcal',
      category: 'อาหารจานเดียว',
      imageUrl: 'https://images.unsplash.com/photo-1562967914-608f82629710?w=500&q=80',
      description: 'ผัดกะเพราหมูสับรสเด็ด เผ็ดร้อน หอมกลิ่นใบกะเพราสด ราดข้าวสวยร้อนๆ อร่อยลงตัว',
      ingredients: [
        'หมูบด 200 กรัม',
        'ใบกะเพรา 1 กำมือ',
        'พริกจินดาและกระเทียมโขลกหยาบ 1 ช้อนโต๊ะ',
        'น้ำมันหอย 1 ช้อนโต๊ะ',
        'น้ำปลา 1 ช้อนชา',
      ],
      steps: [
        'ตั้งกระทะใส่น้ำมัน ผัดพริกและกระเทียมจนหอมกระจาย',
        'ใส่หมูบดลงไปผัดจนสุกทั่ว',
        'ปรุงรสด้วยน้ำมันหอย น้ำปลา และซีอิ๊วดำแต่งสี',
        'ใส่ใบกะเพรา ผัดเร็วๆ แล้วปิดไฟทันที เสิร์ฟพร้อมข้าวสวย',
      ],
    ),
    RecipeModel(
      title: 'สลัดอกไก่ย่าง',
      time: '20 นาที',
      prepTime: '10 นาที',
      cookTime: '10 นาที',
      difficulty: 'ปานกลาง',
      calories: '290 kcal',
      category: 'สุขภาพ',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80',
      description: 'สลัดอกไก่ย่างหอมๆ ผักสลัดสดกรอบ ได้โปรตีนสูง เหมาะสำหรับสายสุขภาพและควบคุมน้ำหนัก',
      ingredients: [
        'อกไก่ 200 กรัม',
        'ผักสลัดคอส / กรีนโอ๊ค 100 กรัม',
        'มะเขือเทศเชอร์รี่ 5 ลูก',
        'น้ำสลัดงาญี่ปุ่น 2 ช้อนโต๊ะ',
      ],
      steps: [
        'หมักอกไก่ด้วยเกลือและพริกไทย ย่างบนกระทะจนสุกทั่ว หั่นเป็นชิ้น',
        'ล้างผักสลัดและมะเขือเทศให้สะอาด จัดใส่จาน',
        'วางอกไก่ย่างลงบนผักสลัด ราดน้ำสลัดงาญี่ปุ่นพร้อมเสิร์ฟ',
      ],
    ),
    RecipeModel(
      title: 'วาฟเฟิลผลไม้รวม',
      time: '15 นาที',
      prepTime: '10 นาที',
      cookTime: '5 นาที',
      difficulty: 'ง่าย',
      calories: '310 kcal',
      category: 'ขนมหวาน',
      imageUrl: 'https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=500&q=80',
      description: 'วาฟเฟิลกรอบนอก นุ่มใน ราดเมเปิลไซรัป เสิร์ฟพร้อมสตรอเบอร์รีและกล้วยหอมสด',
      ingredients: [
        'แป้งวาฟเฟิลสำเร็จรูป 150 กรัม',
        'นมสด 100 ml',
        'ไข่ไก่ 1 ฟอง',
        'สตรอเบอร์รี บลูเบอร์รี กล้วยหอม',
        'เมเปิลไซรัป หรือน้ำผึ้ง',
      ],
      steps: [
        'ผสมแป้งวาฟเฟิล นมสด และไข่ไก่ให้เข้ากันเนียนไร้เม็ดแป้ง',
        'เทแป้งลงในเครื่องทำวาฟเฟิล อบจนเหลืองกรอบทอง',
        'จัดใส่จาน ท็อปด้วยผลไม้สด และราดเมเปิลไซรัปพร้อมเสิร์ฟ',
      ],
    ),
    RecipeModel(
      title: 'ต้มยำกุ้งน้ำข้น',
      time: '25 นาที',
      prepTime: '10 นาที',
      cookTime: '15 นาที',
      difficulty: 'ปานกลาง',
      calories: '280 kcal',
      category: 'อาหารจานเดียว',
      imageUrl: 'https://images.unsplash.com/photo-1548946526-f69e2424cf45?w=500&q=80',
      description: 'ต้มยำกุ้งน้ำข้นรสเด็ด เปรี้ยว เผ็ด เค็ม หอมกลิ่นข่า ตะไคร้ ใบมะกรูด และนมข้นหวาน',
      ingredients: [
        'กุ้งแม่น้ำสด 5 ตัว',
        'เห็ดฟาง 100 กรัม',
        'ข่า ตะไคร้ ใบมะกรูด พริกขี้หนูสด',
        'น้ำพริกเผา 2 ช้อนโต๊ะ',
        'นมข้นจืด 4 ช้อนโต๊ะ',
        'น้ำมะนาวสด 3 ช้อนโต๊ะ',
      ],
      steps: [
        'ตั้งน้ำซุปให้เดือด ใส่ข่า ตะไคร้ ใบมะกรูด และพริกขี้หนูโขลกลงไป',
        'ใส่น้ำพริกเผา เห็ดฟาง และกุ้งแม่น้ำลงไปต้มจนกุ้งสุกสีส้มสวยงาม',
        'ใส่นมข้นจืด ยกลงจากเตา แล้วปรุงรสด้วยน้ำมะนาวและน้ำปลา ชิมรสตามชอบ พร้อมเสิร์ฟ',
      ],
    ),
    RecipeModel(
      title: 'แกงเขียวหวานไก่',
      time: '30 นาที',
      prepTime: '10 นาที',
      cookTime: '20 นาที',
      difficulty: 'ปานกลาง',
      calories: '380 kcal',
      category: 'อาหารจานเดียว',
      imageUrl: 'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=500&q=80',
      description: 'แกงเขียวหวานไก่เนื้อนุ่ม รสกลมกล่อม หอมกะทิสดและพริกแกงเขียวหวานไทยโบราณ',
      ingredients: [
        'เนื้ออกไก่หั่นชิ้น 250 กรัม',
        'พริกแกงเขียวหวาน 2 ช้อนโต๊ะ',
        'หัวกะทิและหางกะทิ 300 ml',
        'มะเขือเปราะ 4 ลูก',
        'ใบโหระพาและพริกชี้ฟ้าแดง',
      ],
      steps: [
        'ผัดพริกแกงเขียวหวานกับหัวกะทิในหม้อจนแตกมันหอม',
        'ใส่เนื้อไก่ลงไปผัดจนสุกเคี่ยวเข้าเนื้อ',
        'เติมหางกะทิ ใส่มะเขือเปราะเคี่ยวจนมะเขือนุ่ม',
        'ปรุงรสด้วยน้ำปลา น้ำตาลปี๊บ โรยใบโหระพาและพริกชี้ฟ้า ปิดไฟพร้อมเสิร์ฟ',
      ],
    ),
  ];

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    final text = _ingredientController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _ingredients.add(text);
        _ingredientController.clear();
      });
    }
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
    });
  }

  void _onBottomNavTapped(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/categories');
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

  void _openRecipeDetail(RecipeModel recipe) {
    Navigator.pushNamed(
      context,
      '/recipe_detail',
      arguments: {
        'title': recipe.title,
        'prepTime': recipe.prepTime,
        'cookTime': recipe.cookTime,
        'difficulty': recipe.difficulty,
        'imageUrl': recipe.imageUrl,
        'description': recipe.description,
        'author': 'Recipe Finder Staff',
        'ingredients': recipe.ingredients,
        'steps': recipe.steps,
      },
    );
  }

  void _showVoiceSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.mic_rounded, color: Color(0xFF157128)),
              SizedBox(width: 8),
              Text('ค้นหาด้วยเสียง', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.graphic_eq_rounded, size: 48, color: Color(0xFF157128)),
              ),
              const SizedBox(height: 16),
              const Text('กำลังฟังเสียงของคุณ...', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('ลองพูดเช่น "ข้าวผัด", "ไข่เจียว", "สลัด"', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _ingredientController.text = 'ไข่';
                  _addIngredient();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ระบบได้รับเสียง: "ไข่" เพิ่มในวัตถุดิบเรียบร้อยแล้ว'),
                    backgroundColor: Color(0xFF157128),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF157128),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('จำลองพูด "ไข่"', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _showScanIngredientsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.qr_code_scanner_rounded, color: Color(0xFF157128)),
              SizedBox(width: 8),
              Text('สแกนวัตถุดิบ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_rounded, size: 40, color: Colors.white70),
                      SizedBox(height: 8),
                      Text('เล็งกล้องไปที่วัตถุดิบในตู้เย็น', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('พบวัตถุดิบอัตโนมัติ: มะเขือเทศ, กล้วยหอม', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF157128))),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  if (!_ingredients.contains('กล้วยหอม')) {
                    _ingredients.add('กล้วยหอม');
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('สแกนสำเร็จ! เพิ่ม "กล้วยหอม" ในรายการวัตถุดิบแล้ว'),
                    backgroundColor: Color(0xFF157128),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF157128),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('เพิ่มวัตถุดิบที่สแกนได้', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);

    // Filter recipes based on selected category tag
    final displayedRecipes = _selectedCategory == 'ทั้งหมด'
        ? _allRecipes
        : _allRecipes.where((r) => r.category == _selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.people_alt_rounded, color: primaryColor),
            tooltip: 'ชุมชนสูตรอาหาร (Community Recipes)',
            onPressed: () {
              Navigator.pushNamed(context, '/community_recipes');
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_rounded, color: primaryColor, size: 28),
            tooltip: 'โปรไฟล์ (Profile)',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Finder Header
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8F5E9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.restaurant_menu_rounded,
                        size: 24,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Recipe Finder',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section: ใส่วัตถุดิบที่คุณมี
              const Text(
                'ใส่วัตถุดิบที่คุณมี',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Input box with ADD button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ingredientController,
                      decoration: InputDecoration(
                        hintText: 'เช่น ไข่, มะเขือเทศ, ข้าว',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: primaryColor, width: 2),
                        ),
                      ),
                      onSubmitted: (_) => _addIngredient(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _addIngredient,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'ADD',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Ingredient Chips
              if (_ingredients.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    _ingredients.length,
                    (index) => Chip(
                      label: Text(
                        _ingredients[index],
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      backgroundColor: const Color(0xFFE8F5E9),
                      deleteIcon: const Icon(
                        Icons.close,
                        size: 16,
                        color: primaryColor,
                      ),
                      onDeleted: () => _removeIngredient(index),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),

              // Quick Action Buttons (ค้นหาด้วยเสียง & สแกนวัตถุดิบ)
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      icon: Icons.mic_none_rounded,
                      label: 'ค้นหาด้วยเสียง',
                      onTap: _showVoiceSearchDialog,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionButton(
                      icon: Icons.qr_code_scanner_rounded,
                      label: 'สแกนวัตถุดิบ',
                      onTap: _showScanIngredientsDialog,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Section: Community Recipes Banner Shortcut
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.groups_rounded,
                        color: primaryColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ชุมชนสูตรอาหาร (Community Recipes)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'ค้นพบสูตรอาหารเด็ดๆ จากเพื่อนๆ นักปรุง',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/community_recipes');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('เข้าดู', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section: Filter Categories Horizontal Chips
              const Text(
                'เลือกหมวดหมู่เมนู',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    final isSelected = cat == _selectedCategory;
                    return ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: primaryColor,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        fontSize: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected ? primaryColor : Colors.grey[300]!,
                        ),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Section: เมนูอาหาร Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedCategory == 'ทั้งหมด'
                        ? 'เมนูยอดนิยม (${displayedRecipes.length})'
                        : 'เมนูหมวดหมู่ $_selectedCategory (${displayedRecipes.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'หมวดหมู่ทั้งหมด >',
                      style: TextStyle(
                        fontSize: 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Recipe Cards List - Renders mouth-watering recipes
              if (displayedRecipes.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(Icons.restaurant_rounded, size: 48, color: Colors.grey),
                        const SizedBox(height: 10),
                        Text(
                          'ไม่พบเมนูในหมวดหมู่ "$_selectedCategory"',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: displayedRecipes.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final recipe = displayedRecipes[index];
                    return _buildInteractiveRecipeCard(recipe);
                  },
                ),
              const SizedBox(height: 20),
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

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF157128), size: 22),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveRecipeCard(RecipeModel recipe) {
    const primaryColor = Color(0xFF157128);

    return InkWell(
      onTap: () => _openRecipeDetail(recipe),
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
            // Appetizing Food Image Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 72,
                height: 72,
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: const Color(0xFFE8F5E9),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE8F5E9),
                      child: const Icon(
                        Icons.restaurant_rounded,
                        size: 36,
                        color: primaryColor,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Recipe Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
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
                        recipe.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.local_fire_department_rounded,
                        size: 14,
                        color: Colors.orange[800],
                      ),
                      const SizedBox(width: 2),
                      Text(
                        recipe.calories,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Difficulty Badge Tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      recipe.difficulty,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Indicator Arrow
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
