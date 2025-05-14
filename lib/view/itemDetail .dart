import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/core/viewmodel/cart_viewmodel.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/models/cart_data/cart_item.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/view/widgets/dropDown.dart';

class ItemDetail3 extends StatelessWidget {
  ProductData product;
  String? size;
  final _formKey = GlobalKey<FormState>();

  ItemDetail3({
    super.key,
    required this.product,
  });
  userController cc = Get.put(userController());
  CartController cca = Get.put(CartController());
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
             Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.orange,
                          ),
                        ),
              const SizedBox(
                width: 20,
              ),
              GetBuilder<CartController>(
                  init: CartController(),
                  builder: (contrlar) {
                    return InkWell(
                      onTap: () {
                        if (cca.selectedSize != "") {
                          // _formKey.currentState!.save();
                          cca.add(CartItem(
                              product: product,
                              quantity: 1,
                              size: cca.selectedSize));
                          cca.resitSize();
                          print(
                              "nnn"); // استدعاء save() فقط إذا كان النموذج صالحًا
                        } else if (cca.selectedSize == "") {
                          Get.snackbar(".", "select size before",
                              duration: const Duration(seconds: 1));
                        }

                        // (1000 >= low)
                        //     ? contrlar.add()
                        //     : null;
                      },
                      child: Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          // color: (1000 < low) ? Colors.grey : Colors.red,
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
                background: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    enlargeFactor: 0.3,
                    reverse: false,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 1.0),
                            // decoration:
                            //     const BoxDecoration(color: Colors.amber),
                            child: InstaImageViewer(
                              child: Image(
                                width: double.infinity,
                                image: Image.network(
                                  fit: BoxFit.fitWidth,
                                  "${EndPoints.getimage_endpoint}?productId=${product.id}&imageName=${product.imagesNames[0]}.jpg",
                                ).image,
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              expandedHeight: 300,
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
                      if (!cc.isInWishList(product.id)) {
                        // cc.add(product.id);
                      } else {
                        // cc.del(product.id);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(250, 250, 250, 0.6),
                      radius: 18,
                      child: Obx(() => Icon(
                            cc.isInWishList(product.id)
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
                  height: 600,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  color: Colors.grey.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        product.name,
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
                          product.description ?? ".",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Column(
                            children: [
                              // Form(
                              //   key: _formKey,
                              //   child: dropDown(
                              //     genderItems: cca
                              //         .extractSizes(data2.quantities.toList()),
                              //     name: "size",
                              //     onSave: (Valuea) {
                              //       size = Valuea;
                              //     },
                              //   ),
                              // ),
                              GetBuilder<CartController>(builder: (controller) {
                                return SegmentedButton<String>(
                                  segments: cca
                                      .extractSizes(product.quantities.toList())
                                      .map((sizes) => ButtonSegment<String>(
                                            value: sizes,
                                            label: Text(sizes),
                                          ))
                                      .toList(),
                                  selected: {
                                    controller.selectedSize.toString()
                                  },
                                  onSelectionChanged:
                                      (Set<String> newSelection) {
                                    controller.changeSize(newSelection.first);
                                  },
                                  showSelectedIcon: false,
                                  style: ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.standard,
                                    textStyle: WidgetStateProperty.resolveWith<
                                        TextStyle>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.selected)) {
                                          return const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold);
                                        }
                                        return const TextStyle(fontSize: 14);
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      )
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
