import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String? title;
  final String? prepTime;
  final String? cookTime;
  final String? difficulty;
  final String? imageUrl;
  final String? description;
  final String? author;
  final List<String>? ingredients;
  final List<String>? steps;

  const RecipeDetailScreen({
    super.key,
    this.title,
    this.prepTime,
    this.cookTime,
    this.difficulty,
    this.imageUrl,
    this.description,
    this.author,
    this.ingredients,
    this.steps,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);

    // Read route settings arguments if passed via ModalRoute
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final title = widget.title ?? routeArgs?['title'] ?? 'ไข่เจียวมะเขือเทศ';
    final prepTime = widget.prepTime ?? routeArgs?['prepTime'] ?? '15 นาที';
    final cookTime = widget.cookTime ?? routeArgs?['cookTime'] ?? '10 นาที';
    final difficulty = widget.difficulty ?? routeArgs?['difficulty'] ?? 'ง่าย';
    final imageUrl = widget.imageUrl ?? routeArgs?['imageUrl'];
    final description = widget.description ?? routeArgs?['description'] ?? 'สูตรอาหารแสนอร่อย ทำง่าย ทำกินเองได้ที่บ้าน!';
    final author = widget.author ?? routeArgs?['author'];

    final List<String> ingredients = widget.ingredients ??
        (routeArgs?['ingredients'] as List<String>?) ??
        [
          'ไข่ไก่ 2 ฟอง',
          'มะเขือเทศ 1 ลูก (หั่นเต๋า)',
          'ซีอิ๊วขาว 1 ช้อนชา',
          'น้ำมันพืชสำหรับทอด 2 ช้อนโต๊ะ',
          'พริกไทยป่นเล็กน้อย',
        ];

    final List<String> tools = [
      'กระทะทอด',
      'ตะหลิว',
      'ชามผสม',
      'ส้อมสำหรับตีไข่',
    ];

    final List<String> steps = widget.steps ??
        (routeArgs?['steps'] as List<String>?) ??
        [
          'ตอกไข่ไก่ใส่ชาม ปรุงรสด้วยซีอิ๊วขาวและพริกไทยป่น ตีให้เข้ากัน',
          'ใส่มะเขือเทศหั่นเต๋าลงไปในชามไข่ แล้วคนให้เข้ากันเบาๆ',
          'ตั้งกระทะใส่น้ำมันพืช ใช้ไฟปานกลาง รอจนน้ำมันร้อน',
          'เทไข่ใส่ลงในกระทะ ทอดจนสุกเหลืองกรอบทั้งสองด้าน',
          'ตักขึ้นพักให้สะเด็ดน้ำมัน จัดใส่จานพร้อมเสิร์ฟความอร่อย',
        ];

    final List<String> tips = [
      'ใช้น้ำมันร้อนปานกลางจะช่วยให้วัตถุดิบสุกหอม และนุ่มกำลังดี',
    ];

    final Map<String, String> nutrition = {
      'แคลอรี': '210 kcal',
      'โปรตีน': '12 g',
      'ไขมัน': '15 g',
      'คาร์โบไฮเดรต': '6 g',
    };

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        title: const Text(
          'Recipe Detail',
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
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: _isFavorite ? Colors.red : Colors.black87,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _isFavorite ? 'เพิ่มเข้าในรายการโปรดแล้ว' : 'ยกเลิกรายการโปรดแล้ว',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Recipe Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              if (author != null) ...[
                const SizedBox(height: 4),
                Text(
                  'โดย $author',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: 16),

              // Hero Food Image Banner Container
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFCC80), Color(0xFFFF8A65)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildFallbackBanner();
                          },
                        )
                      : _buildFallbackBanner(),
                ),
              ),

              if (description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              const SizedBox(height: 16),

              // Stats Row (Prep Time, Cook Time, Difficulty)
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      value: prepTime,
                      label: 'เวลาเตรียม',
                      icon: Icons.access_time_rounded,
                      iconColor: Colors.blue[700]!,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(
                      value: cookTime,
                      label: 'เวลาทำ',
                      icon: Icons.timer_outlined,
                      iconColor: Colors.orange[800]!,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(
                      value: difficulty,
                      label: 'ระดับความยาก',
                      icon: Icons.bar_chart_rounded,
                      iconColor: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Accordion / Expandable Detail Sections
              _buildExpandableSection(
                title: 'วัตถุดิบ (Ingredients)',
                icon: Icons.format_list_bulleted_rounded,
                initiallyExpanded: true,
                child: Column(
                  children: ingredients
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                const Icon(Icons.circle, size: 6, color: primaryColor),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),

              _buildExpandableSection(
                title: 'อุปกรณ์ครัว (Cooking Tools)',
                icon: Icons.kitchen_outlined,
                child: Column(
                  children: tools
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                const Icon(Icons.check_circle_outline_rounded,
                                    size: 16, color: primaryColor),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),

              _buildExpandableSection(
                title: 'ขั้นตอนการทำ (Steps)',
                icon: Icons.format_list_numbered_rounded,
                initiallyExpanded: true,
                child: Column(
                  children: List.generate(steps.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE8F5E9),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              steps[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 12),

              _buildExpandableSection(
                title: 'เทคนิคและเคล็ดลับ (Tips & Tricks)',
                icon: Icons.lightbulb_outline_rounded,
                child: Column(
                  children: tips
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),

              _buildExpandableSection(
                title: 'ข้อมูลโภชนาการ (Nutrition Info)',
                icon: Icons.pie_chart_outline_rounded,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: nutrition.entries.map((entry) {
                    return Column(
                      children: [
                        Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Bottom Primary Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('เพิ่ม "$title" ในแผนมื้ออาหารเรียบร้อยแล้ว!'),
                        backgroundColor: primaryColor,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_task_rounded, size: 20),
                  label: const Text(
                    'เพิ่มในแผนมื้ออาหาร (Add to Meal Planner)',
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackBanner() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_rounded,
            size: 64,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            'Delicious Community Recipe',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 22, color: iconColor),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required IconData icon,
    required Widget child,
    bool initiallyExpanded = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: Icon(icon, color: const Color(0xFF157128), size: 22),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          expandedAlignment: Alignment.centerLeft,
          children: [child],
        ),
      ),
    );
  }
}
