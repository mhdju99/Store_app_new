// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store_app/view/screens/catogery_product.dart';

class catogore2 extends StatelessWidget {
  String name;
  Color color;
  catogore2({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: InkWell(
        onTap: () {
          Get.to(catogeryproduct(
            category: name,
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.6), color],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 15,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.style_outlined,
                          size: 60, color: Colors.white))),
              const SizedBox(height: 10),
              Positioned(
                bottom: 10,
                right: 20,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData find(String name) {
    print(name);
    name = name.toLowerCase();

    if (name == "laptops") {
      return Icons.laptop;
    } else if (name == "phone") {
      return Icons.phone_android;
    } else if (name == "camera") {
      return Icons.camera_alt_outlined;
    } else if (name == "routers") {
      return Icons.route;
    } else if (name == "security camera") {
      return Icons.camera;
    } else {
      return Icons.apps_outlined;
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فئات المتجر',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal', // يمكنك استخدام خط عربي مثل Tajawal
      ),
      home: CategoriesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Fashion', 'icon': Icons.shopping_bag, 'color': Colors.pinkAccent},
    {'name': 'Beauty', 'icon': Icons.spa, 'color': Colors.purpleAccent},
    {
      'name': 'Electronics',
      'icon': Icons.electrical_services,
      'color': Colors.blueAccent
    },
    {'name': 'Jewellery', 'icon': Icons.diamond, 'color': Colors.amber},
    {
      'name': 'Footwear',
      'icon': Icons.shopping_cart,
      'color': Colors.greenAccent
    },
    {'name': 'Toys', 'icon': Icons.toys, 'color': Colors.redAccent},
    {'name': 'Furniture', 'icon': Icons.chair, 'color': Colors.brown},
    {'name': 'Mobiles', 'icon': Icons.phone_iphone, 'color': Colors.tealAccent},
  ];

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryName: categories[index]['name'],
              icon: categories[index]['icon'],
              color: categories[index]['color'],
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData icon;
  final Color color;

  const CategoryCard({
    Key? key,
    required this.categoryName,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // يمكنك إضافة التنقل إلى صفحة الفئة هنا
          print('تم الضغط على $categoryName');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.7), color],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:store_app/view/screens/catogery_product.dart';

// class catogore2 extends StatelessWidget {
//   String name;
//   bool colers = false;
//   catogore2({super.key, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(right: 0),
//       child: InkWell(
//         onTap: () {
//           Get.to(catogeryproduct(
//             category: name,
//           ));
//         },
//         child: Stack(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.shade400,
//                     blurRadius: 15,
//                     offset: const Offset(8, 8),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.all(7),
//             ),
//             // خلفية شفافة للأيقونة
//             Positioned(
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Icon(
//                   Icons.apps_outlined,
//                   size: 70,
//                   color: Colors.grey.withOpacity(0.2), // شفافية
//                 ),
//               ),
//             ),

//             // محتوى العنصر
//             Center(
//               child: Text(
//                 name,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconData find(String name) {
//     print(name);
//     name = name.toLowerCase();

//     if (name == "laptops") {
//       return Icons.laptop;
//     } else if (name == "phone") {
//       return Icons.phone_android;
//     } else if (name == "camera") {
//       return Icons.camera_alt_outlined;
//     } else if (name == "routers") {
//       return Icons.route;
//     } else if (name == "security camera") {
//       return Icons.camera;
//     } else {
//       return Icons.apps_outlined;
//     }
//   }
// }
