import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/screens/catogery_product.dart';

class catogore2 extends StatelessWidget {
  String name;
  bool colers = false;
  catogore2({super.key, required this.name});

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
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 7,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(7),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
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
