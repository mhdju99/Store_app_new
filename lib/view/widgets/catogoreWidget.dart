import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/screens/catogery_product.dart';

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
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: colers ? Colors.orange.shade200 : Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                  height: 50,
                  width: 50,
                  icon[name.toLowerCase()] ?? "assets/images/sneakers.png"),
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  final Map<String, String> icon = {
    'outwear': "assets/images/jacket.png",
    "t-shirt": "assets/images/t-shirt.png",
    "Shoes": "assets/images/sneakers.png",
    "hoodie": "assets/images/hoodie.png",
    "shirt": "assets/images/tshirt.png",
  };
}
