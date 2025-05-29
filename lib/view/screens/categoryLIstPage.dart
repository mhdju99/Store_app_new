// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/homePage_viewmodel.dart';
import 'package:store_app/utils/constants/style.dart';
import 'package:store_app/view/widgets/catogoreWidget%20copy.dart';
import 'package:store_app/view/widgets/catogoreWidget.dart';
import 'dart:math';

class Categorylistpage extends StatelessWidget {
  Categorylistpage({
    Key? key,
  }) : super(key: key);
  HomeControllar cc = Get.put(HomeControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Category"),
      ),
      body: Obx(() {
        if (!cc.loading.value) {
          List<String> cat = cc.extractCategory(cc.Allproduct!);
          return true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 150,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    // scrollDirection: Axis.vertical,
                    itemCount: cat.length,
                    itemBuilder: (BuildContext, i) {
                      return catogore2(
                        name: cat[i].toString(),
                        color: coler().getDarkColorByIndex(i),
                      );
                    },
                  ),
                )
              : const Center(child: Text("no data"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
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
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          // يمكنك إضافة التنقل إلى صفحة الفئة هنا
          print('تم الضغط على $categoryName');
        },
      ),
    );
  }

// مثال استخدام في قائمة الفئات
}
