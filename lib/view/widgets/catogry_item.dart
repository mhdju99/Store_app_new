
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CatogeryItem extends StatelessWidget {
  String name;
  IconData icon;
  bool colers = false;
  CatogeryItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colers ? Colors.orange.shade200 : Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(15),
              child: Icon(
                icon,
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
}
