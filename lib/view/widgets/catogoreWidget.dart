import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/catogery_product.dart';

class catogore extends StatelessWidget {
  String name;
  bool colers = false;
  catogore({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          Get.to(catogeryproduct(
            category: name,
          ));
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colers ? Colors.orange.shade200 : Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(15),
              child: Icon(
                find(name),
                size: 50,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
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
    } else if (name == "smart tv") {
      return Icons.tv;
    } else if (name == "headphone") {
      return Icons.headphones;
    } else {
      return Icons.phone_android;
    }
  }
}
