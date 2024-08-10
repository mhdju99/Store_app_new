import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:store_app/core/constants/constant.dart';
import 'package:store_app/core/viewmodel/cart_viewmodel.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/models/product/product.dart';

class ItemDetail3 extends StatelessWidget {
  ProductData data2;
  ItemDetail3({
    super.key,
    required this.data2,
  });
  int low = lows.lowStack;
  userController cc = Get.put(userController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        child: Container(
          color: Colors.blueGrey.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (data2.repoInfo.price != null)
                  ? (data2.repoInfo.currantQuantity >= low)
                      ? Text(
                          "\$${data2.repoInfo.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.orange,
                          ),
                        )
                      : const Text(
                          "Product Unavailable",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 13),
                        )
                  : const Text(
                      "Product Unavailable",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 13),
                    ),
              const SizedBox(
                width: 20,
              ),
              GetBuilder<CartController>(
                  init: CartController(),
                  builder: (contrlar) {
                    return InkWell(
                      onTap: () {
                        (data2.repoInfo.currantQuantity >= low)
                            ? contrlar.add(data2.id)
                            : null;
                      },
                      child: Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          color: (data2.repoInfo.currantQuantity < low)
                              ? Colors.grey
                              : Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: InstaImageViewer(
                  child: Image(
                    image:
                        Image.network(fit: BoxFit.fitWidth, data2.imageCovered)
                            .image,
                  ),
                ),
              ),
              expandedHeight: 350,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      Container(
                        height: 4,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      if (!cc.isInWishList(data2.id)) {
                        cc.add(data2.id);
                      } else {
                        cc.del(data2.id);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(250, 250, 250, 0.6),
                      radius: 18,
                      child: Obx(() => Icon(
                            cc.isInWishList(data2.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 25,
                          )),
                    ),
                  ),
                ),
              ],
              title: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                },
                child: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                  radius: 18,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  color: Colors.grey.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        data2.title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '4.3',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          data2.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
