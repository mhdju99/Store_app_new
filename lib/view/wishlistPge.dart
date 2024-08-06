import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/view/itemDetail%20.dart';

class wishlist extends StatelessWidget {
  wishlist({super.key});
  userController uu = Get.put(userController());
  HomeControllar cc = Get.put(HomeControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My wishlist",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Metropolis",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Expanded(
                  child: uu.wishlist.isNotEmpty
                      ? Obx(() {
                          return uu.wishlist.value.isNotEmpty
                              ? ListView.builder(
                                  itemCount: uu.wishlist.length,
                                  itemBuilder: (c, index) {
                                    print(uu.wishlist[index]);
                                    var product =
                                        cc.Findproduct(uu.wishlist[index]);
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(ItemDetail3(data2: product));
                                      },
                                      child: Card(
                                        color: Colors.grey[200],
                                        elevation: 5,
                                        child: ListTile(
                                          title: Text(product.title),
                                          leading: SizedBox(
                                            width: 60,
                                            child: Image.network(
                                                product.imageCovered),
                                          ),
                                          subtitle: Text(
                                            "${product.repoInfo.price!.toString()} s.p",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange),
                                          ),
                                          trailing:
                                              const Icon(Icons.arrow_right),
                                        ),
                                      ),
                                    );
                                  })
                              : const Center(
                                  child: Text("no data"),
                                );
                        })
                      : const Center(
                          child: Text("no data"),
                        ))
            ],
          ),
        ));
  }
}
