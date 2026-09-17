import 'package:flutter/material.dart';

class CommunityRecipesScreen extends StatefulWidget {
  const CommunityRecipesScreen({super.key});

  @override
  State<CommunityRecipesScreen> createState() => _CommunityRecipesScreenState();
}

class _CommunityRecipesScreenState extends State<CommunityRecipesScreen> {
  int _currentIndex = 1; // Search/Community tab

  final List<CommunityPost> _posts = [
    CommunityPost(
      authorName: 'Baking Lover',
      timeAgo: '2 ชั่วโมงที่แล้ว',
      recipeTitle: 'เค้กช็อกโกแลตหน้านิ่ม',
      description: 'เค้กช็อกโกแลตสูตรนุ่มละมุน ทำง่าย อร่อยมาก!',
      imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
      likes: 128,
      comments: 24,
      isLiked: false,
      isBookmarked: false,
      prepTime: '20 นาที',
      cookTime: '30 นาที',
      difficulty: 'ปานกลาง',
      ingredients: [
        'แป้งเค้ก 100 กรัม',
        'ผงโกโก้ 30 กรัม',
        'น้ำตาลทราย 120 กรัม',
        'ไข่ไก่ 3 ฟอง',
        'นมสด 80 ml',
        'เนยละลาย 50 กรัม',
        'ผงโกโก้ทำหน้านิ่ม 40 กรัม',
      ],
      steps: [
        'ร่อนแป้งเค้ก ผงโกโก้ และผงฟูเข้าด้วยกันพักไว้',
        'ตีไข่ไก่กับน้ำตาลทรายจนฟูเป็นครีมขาว',
        'ผสมส่วนผสมแห้งและส่วนผสมของเหลวเข้าด้วยกัน นำเข้าอบที่ 180°C เป็นเวลา 25 นาที',
        'กวนซอสช็อกโกแลตหน้านิ่มจนข้น แล้วราดลงบนตัวเค้กที่เย็นแล้ว',
      ],
    ),
    CommunityPost(
      authorName: 'Healthy Foodie',
      timeAgo: '5 ชั่วโมงที่แล้ว',
      recipeTitle: 'สลัดอกไก่ย่าง',
      description: 'สลัดเพื่อสุขภาพ ทำง่าย ได้โปรตีนสูง',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80',
      likes: 96,
      comments: 18,
      isLiked: true,
      isBookmarked: true,
      prepTime: '15 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      ingredients: [
        'อกไก่ 200 กรัม',
        'ผักสลัดคอส / กรีนโอ๊ค 100 กรัม',
        'มะเขือเทศเชอร์รี่ 5 ลูก',
        'อะโวคาโดหั่นชิ้น 1/2 ลูก',
        'น้ำสลัดงาญี่ปุ่น 2 ช้อนโต๊ะ',
        'เกลือและพริกไทยสำหรับหมักไก่',
      ],
      steps: [
        'หมักอกไก่ด้วยเกลือและพริกไทย ย่างบนกระทะจนสุกทั่ว หั่นเป็นชิ้นพอดีคำ',
        'ล้างผักสลัดให้สะอาดและจัดใส่จาน',
        'วางอกไก่ย่าง อะโวคาโด และมะเขือเทศเชอร์รี่ลงบนผักสลัด',
        'ราดน้ำสลัดงาญี่ปุ่นพร้อมเสิร์ฟ',
      ],
    ),
    CommunityPost(
      authorName: 'Easy Cooking',
      timeAgo: '1 วันที่แล้ว',
      recipeTitle: 'ผัดกะเพราหมูสับ',
      description: 'เมนูสิ้นคิด แต่อร่อยเด็ดแน่นอน',
      imageUrl: 'https://images.unsplash.com/photo-1562967914-608f82629710?w=500&q=80',
      likes: 152,
      comments: 31,
      isLiked: false,
      isBookmarked: false,
      prepTime: '10 นาที',
      cookTime: '8 นาที',
      difficulty: 'ง่าย',
      ingredients: [
        'หมูบด 200 กรัม',
        'ใบกะเพรา 1 กำมือ',
        'พริกจินดาและกระเทียมกลีบใหญ่ โขลกหยาบ',
        'น้ำมันหอย 1 ช้อนโต๊ะ',
        'น้ำปลา 1 ช้อนชา',
        'ซีอิ๊วดำเล็กน้อยแต่งสี',
      ],
      steps: [
        'ตั้งกระทะใส่น้ำมัน ผัดพริกและกระเทียมให้หอมกระจาย',
        'ใส่หมูบดลงไปผัดจนสุกทั่ว',
        'ปรุงรสด้วยน้ำมันหอย น้ำปลา ซีอิ๊วดำ และน้ำตาลทรายเล็กน้อย',
        'ใส่ใบกะเพราลงไป ผัดเร็วๆ แล้วปิดไฟทันที',
      ],
    ),
    CommunityPost(
      authorName: 'Sweet Tooth',
      timeAgo: '2 วันที่แล้ว',
      recipeTitle: 'วาฟเฟิลผลไม้รวม',
      description: 'วาฟเฟิลกรอบนอก นุ่มใน กับผลไม้สด',
      imageUrl: 'https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=500&q=80',
      likes: 87,
      comments: 15,
      isLiked: false,
      isBookmarked: false,
      prepTime: '15 นาที',
      cookTime: '10 นาที',
      difficulty: 'ง่าย',
      ingredients: [
        'แป้งวาฟเฟิลสำเร็จรูป 150 กรัม',
        'นมสด 100 ml',
        'ไข่ไก่ 1 ฟอง',
        'สตรอเบอร์รี บลูเบอร์รี และกล้วยหอม',
        'เมเปิลไซรัป หรือน้ำผึ้ง',
        'ไอศกรีมวานิลลา 1 สกู๊ป',
      ],
      steps: [
        'ผสมแป้งวาฟเฟิล นมสด และไข่ไก่ให้เข้ากันเนียนไร้เม็ดแป้ง',
        'เทแป้งลงในเครื่องทำวาฟเฟิล อบจนเหลืองกรอบทอง',
        'จัดวาฟเฟิลใส่จาน ท็อปด้วยผลไม้สดและไอศกรีม',
        'ราดเมเปิลไซรัปฉ่ำๆ พร้อมรับประทาน',
      ],
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

  void _openRecipeDetail(CommunityPost post) {
    Navigator.pushNamed(
      context,
      '/recipe_detail',
      arguments: {
        'title': post.recipeTitle,
        'prepTime': post.prepTime,
        'cookTime': post.cookTime,
        'difficulty': post.difficulty,
        'imageUrl': post.imageUrl,
        'description': post.description,
        'author': post.authorName,
        'ingredients': post.ingredients,
        'steps': post.steps,
      },
    );
  }

  void _showAddRecipeDialog() {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'แชร์สูตรของคุณ (Add Your Recipe)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF157128)),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'ชื่อสูตรอาหาร',
                    hintText: 'เช่น ต้มยำกุ้งน้ำข้น',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'คำอธิบาย / เคล็ดลับความอร่อย',
                    hintText: 'เช่น สูตรนี้เด็ดตรงที่ใช้น้ำมะนาวสด...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final desc = descController.text.trim();
                if (title.isNotEmpty) {
                  setState(() {
                    _posts.insert(
                      0,
                      CommunityPost(
                        authorName: 'คุณ (You)',
                        timeAgo: 'เมื่อสักครู่',
                        recipeTitle: title,
                        description: desc.isNotEmpty ? desc : 'สูตรอาหารพิเศษสร้างสรรค์โดยคุณ!',
                        imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80',
                        likes: 0,
                        comments: 0,
                        isLiked: false,
                        isBookmarked: false,
                        prepTime: '15 นาที',
                        cookTime: '15 นาที',
                        difficulty: 'ง่าย',
                        ingredients: ['ส่วนผสมสูตรของคุณ'],
                        steps: ['ขั้นตอนการทำสูตรของคุณ'],
                      ),
                    );
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('แชร์สูตร "$title" เรียบร้อยแล้ว!'),
                      backgroundColor: const Color(0xFF157128),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF157128),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('แชร์สูตร', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        title: const Text(
          'Community Recipes',
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
        child: Column(
          children: [
            // Feed List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                physics: const BouncingScrollPhysics(),
                itemCount: _posts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return _buildPostCard(post);
                },
              ),
            ),

            // Share Recipe Primary Button Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _showAddRecipeDialog,
                  icon: const Icon(Icons.add_a_photo_rounded, size: 20),
                  label: const Text(
                    'แชร์สูตรของคุณ (Add Your Recipe)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              label: 'ค้นหา/ชุมชน',
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

  Widget _buildPostCard(CommunityPost post) {
    return InkWell(
      onTap: () => _openRecipeDetail(post),
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Header Row
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xFFE8F5E9),
                  child: Text(
                    post.authorName.isNotEmpty ? post.authorName[0] : 'U',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF157128),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.authorName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        post.timeAgo,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    post.isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: post.isBookmarked ? const Color(0xFF157128) : Colors.grey[400],
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      post.isBookmarked = !post.isBookmarked;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Recipe Title & Description
            Text(
              post.recipeTitle,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              post.description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),

            // Recipe Food Photo
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFFFF3E0),
                      child: const Center(
                        child: Icon(Icons.restaurant_rounded, size: 48, color: Colors.orange),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Like and Comment Actions
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (post.isLiked) {
                        post.likes--;
                        post.isLiked = false;
                      } else {
                        post.likes++;
                        post.isLiked = true;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          post.isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          size: 18,
                          color: post.isLiked ? Colors.red : Colors.grey[600],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${post.likes}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${post.comments}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'กดเพื่อดูสูตรวิธีทำ >',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF157128),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityPost {
  final String authorName;
  final String timeAgo;
  final String recipeTitle;
  final String description;
  final String imageUrl;
  int likes;
  int comments;
  bool isLiked;
  bool isBookmarked;
  final String prepTime;
  final String cookTime;
  final String difficulty;
  final List<String> ingredients;
  final List<String> steps;

  CommunityPost({
    required this.authorName,
    required this.timeAgo,
    required this.recipeTitle,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.isBookmarked,
    required this.prepTime,
    required this.cookTime,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
  });
}
