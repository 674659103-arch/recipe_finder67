import 'package:flutter/material.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  int _currentIndex = 3; // Meal Planner tab
  DateTime _selectedDate = DateTime(2024, 5, 15);

  // Sample planned meals per day
  final Map<int, Map<String, PlannedMeal>> _plannedMealsByDay = {
    15: {
      'เช้า': PlannedMeal(
        type: 'เช้า',
        title: 'สมูทตี้กล้วย',
        time: '5 นาที',
        calories: '180 kcal',
        icon: Icons.local_drink_rounded,
        iconBgColor: const Color(0xFFFFF9C4),
        iconColor: const Color(0xFFF57F17),
        imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=300&q=80',
      ),
      'กลางวัน': PlannedMeal(
        type: 'กลางวัน',
        title: 'ข้าวผัดไข่',
        time: '15 นาที',
        calories: '350 kcal',
        icon: Icons.rice_bowl_rounded,
        iconBgColor: const Color(0xFFFFECB3),
        iconColor: const Color(0xFFFF8F00),
        imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300&q=80',
      ),
      'เย็น': PlannedMeal(
        type: 'เย็น',
        title: 'ต้มจืดไข่น้ำ',
        time: '20 นาที',
        calories: '220 kcal',
        icon: Icons.soup_kitchen_rounded,
        iconBgColor: const Color(0xFFE0F2F1),
        iconColor: const Color(0xFF00695C),
        imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554?w=300&q=80',
      ),
    },
    16: {
      'เช้า': PlannedMeal(
        type: 'เช้า',
        title: 'สปาเก็ตตี้คาโบนารา',
        time: '25 นาที',
        calories: '450 kcal',
        icon: Icons.dinner_dining_rounded,
        iconBgColor: const Color(0xFFFFCDD2),
        iconColor: const Color(0xFFC62828),
        imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=300&q=80',
      ),
      'กลางวัน': PlannedMeal(
        type: 'กลางวัน',
        title: 'ไข่เจียวมะเขือเทศ',
        time: '15 นาที',
        calories: '210 kcal',
        icon: Icons.egg_alt_rounded,
        iconBgColor: const Color(0xFFFFE0B2),
        iconColor: const Color(0xFFE65100),
        imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=300&q=80',
      ),
    },
  };

  void _onBottomNavTapped(int index) {
    if (index == _currentIndex) return;

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/categories');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/favorites');
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _generateShoppingList() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ShoppingListModal(selectedDay: _selectedDate.day),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);
    final dayMeals = _plannedMealsByDay[_selectedDate.day] ?? {};

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        title: const Text(
          'Meal Planner',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Header Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Meal Planner',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_month_rounded, size: 16, color: primaryColor),
                        SizedBox(width: 6),
                        Text(
                          'พฤษภาคม 2024',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Calendar Days Strip Container
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                child: Column(
                  children: [
                    // Week Days Row Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('อา.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('จ.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('อ.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('พ.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('พฤ.', style: TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.bold)),
                        Text('ศ.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text('ส.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Calendar Day Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(7, (index) {
                        final dayNum = 12 + index; // 12, 13, 14, 15, 16, 17, 18
                        final isSelected = dayNum == _selectedDate.day;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = DateTime(2024, 5, dayNum);
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 38,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isSelected ? primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: primaryColor.withOpacity(0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$dayNum',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.white : Colors.black87,
                                  ),
                                ),
                                if (_plannedMealsByDay.containsKey(dayNum)) ...[
                                  const SizedBox(height: 3),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: isSelected ? Colors.white : primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Planned Meals Header for Selected Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'เมนูประจำวันที่ ${_selectedDate.day} พฤษภาคม 2024',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline_rounded, color: primaryColor),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('เลือกเมนูที่ต้องการเพิ่มจากหน้าค้นหา')),
                      );
                      Navigator.pushNamed(context, '/categories');
                    },
                    tooltip: 'เพิ่มเมนูอาหาร',
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Meal Cards List (เช้า, กลางวัน, เย็น)
              _buildMealSection(
                mealType: 'เช้า',
                meal: dayMeals['เช้า'],
                fallbackTitle: 'สมูทตี้กล้วย',
                fallbackTime: '5 นาที',
                fallbackIcon: Icons.local_drink_rounded,
                bgColor: const Color(0xFFFFF9C4),
                accentColor: const Color(0xFFF57F17),
              ),
              const SizedBox(height: 12),

              _buildMealSection(
                mealType: 'กลางวัน',
                meal: dayMeals['กลางวัน'],
                fallbackTitle: 'ข้าวผัดไข่',
                fallbackTime: '15 นาที',
                fallbackIcon: Icons.rice_bowl_rounded,
                bgColor: const Color(0xFFFFECB3),
                accentColor: const Color(0xFFFF8F00),
              ),
              const SizedBox(height: 12),

              _buildMealSection(
                mealType: 'เย็น',
                meal: dayMeals['เย็น'],
                fallbackTitle: 'ต้มจืดไข่น้ำ',
                fallbackTime: '20 นาที',
                fallbackIcon: Icons.soup_kitchen_rounded,
                bgColor: const Color(0xFFE0F2F1),
                accentColor: const Color(0xFF00695C),
              ),
              const SizedBox(height: 28),

              // Generate Shopping List Action Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _generateShoppingList,
                  icon: const Icon(Icons.shopping_cart_checkout_rounded, size: 20),
                  label: const Text(
                    'สร้างรายการซื้อของ (Generate Shopping List)',
                    style: TextStyle(
                      fontSize: 14,
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

  Widget _buildMealSection({
    required String mealType,
    required PlannedMeal? meal,
    required String fallbackTitle,
    required String fallbackTime,
    required IconData fallbackIcon,
    required Color bgColor,
    required Color accentColor,
  }) {
    final title = meal?.title ?? fallbackTitle;
    final time = meal?.time ?? fallbackTime;
    final icon = meal?.icon ?? fallbackIcon;
    final imageUrl = meal?.imageUrl;

    return Container(
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
          // Meal Tag Label (เช้า / กลางวัน / เย็น)
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  mealType == 'เช้า'
                      ? Icons.wb_sunny_outlined
                      : (mealType == 'กลางวัน'
                          ? Icons.wb_cloudy_outlined
                          : Icons.nights_stay_outlined),
                  size: 18,
                  color: const Color(0xFF157128),
                ),
                const SizedBox(height: 4),
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF157128),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Food Appetizing Image / Icon Box
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 56,
              height: 56,
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: bgColor,
                          child: Icon(icon, size: 28, color: accentColor),
                        );
                      },
                    )
                  : Container(
                      color: bgColor,
                      child: Icon(icon, size: 28, color: accentColor),
                    ),
            ),
          ),
          const SizedBox(width: 12),

          // Recipe Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
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

          // Interactive View Detail Action
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            onPressed: () {
              Navigator.pushNamed(context, '/recipe_detail');
            },
          ),
        ],
      ),
    );
  }
}

class PlannedMeal {
  final String type;
  final String title;
  final String time;
  final String calories;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String? imageUrl;

  PlannedMeal({
    required this.type,
    required this.title,
    required this.time,
    required this.calories,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    this.imageUrl,
  });
}

// Shopping List Modal Component
class _ShoppingListModal extends StatefulWidget {
  final int selectedDay;

  const _ShoppingListModal({required this.selectedDay});

  @override
  State<_ShoppingListModal> createState() => _ShoppingListModalState();
}

class _ShoppingListModalState extends State<_ShoppingListModal> {
  final List<ShoppingItem> _items = [
    ShoppingItem(name: 'กล้วยหอม 2 ลูก', category: 'ผลไม้', checked: false),
    ShoppingItem(name: 'นมสด 200 ml', category: 'นม & เนย', checked: false),
    ShoppingItem(name: 'ไข่ไก่ 5 ฟอง', category: 'ของสด', checked: true),
    ShoppingItem(name: 'มะเขือเทศ 2 ลูก', category: 'ผักสด', checked: false),
    ShoppingItem(name: 'ข้าวสวย 2 ถ้วย', category: 'อาหารแห้ง', checked: true),
    ShoppingItem(name: 'ต้นหอม / ผักชี', category: 'ผักสด', checked: false),
    ShoppingItem(name: 'ซีอิ๊วขาว', category: 'เครื่องปรุง', checked: true),
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF157128);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Modal Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.shopping_bag_rounded, color: primaryColor, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    'รายการซื้อของ (${widget.selectedDay} พ.ค.)',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8),

          // Shopping Items List with Checkboxes
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return CheckboxListTile(
                  activeColor: primaryColor,
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 15,
                      decoration: item.checked ? TextDecoration.lineThrough : null,
                      color: item.checked ? Colors.grey : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    item.category,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  value: item.checked,
                  onChanged: (bool? value) {
                    setState(() {
                      item.checked = value ?? false;
                    });
                  },
                );
              },
            ),
          ),

          // Done Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'เสร็จสิ้น',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingItem {
  final String name;
  final String category;
  bool checked;

  ShoppingItem({
    required this.name,
    required this.category,
    required this.checked,
  });
}
