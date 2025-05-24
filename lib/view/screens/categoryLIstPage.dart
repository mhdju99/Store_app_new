// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/homePage_viewmodel.dart';
import 'package:store_app/view/widgets/catogoreWidget%20copy.dart';
import 'package:store_app/view/widgets/catogoreWidget.dart';

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
                  padding: const EdgeInsets.all(5.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 130,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    // scrollDirection: Axis.vertical,
                    itemCount: cat.length,
                    itemBuilder: (BuildContext, i) {
                      return catogore2(name: cat[i].toString());
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
