import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
import 'package:store_app/core/viewmodel/cart_viewmodel.dart';
import 'package:store_app/models/product/product.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  products data = products(
    category: "dcv",
    description: "SAddddddddddddddddddddddd",
    price: 22,
    title: "SAdasd",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: T,
          title: const Text(
            "shopping cart",
            style: TextStyle(
              fontFamily: "Metropolis",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //        SizedBox(
        //         height: 50,
        //         child: Column(
        //           children: [
        //             Text(
        //               "TOTAL",
        //               style: TextStyle(
        //                 color: Colors.grey,
        //                 fontSize: 10,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               cc.totalprice.toString(),
        //               style: TextStyle(
        //                 color: Colors.orange,
        //                 fontSize: 19,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           print("cc.product");
        //         },
        //         child: Container(
        //           width: 170,
        //           height: 50,
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: const Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               Icon(
        //                 Icons.shopping_cart_outlined,
        //                 color: Colors.white,
        //               ),
        //               Text(
        //                 'CHECK OUT',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 15,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),),

        body: GetBuilder<CartController>(
            init: CartController(),
            builder: (cc) {
              return cc.isempity
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                                "assets/images/empty-cart.png"),
                          ),
                          const Text(
                            "shopping cart is empty",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: ListView.builder(
                              itemCount: cc.product!.length,
                              itemBuilder: (c, index) {
                                final items = cc.product!;
                                final item = cc.product![index];
                                print(items);

                                return Dismissible(
                                    key: Key(cc.product!.toString()),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (dirction) {
                                      items.removeAt(index);
                                      print(item.Productid!);
                                      cc.dellProduct(item.Productid!.toInt());
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              child: Image.network(
                                                item.image.toString(),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.title
                                                      .toString()
                                                      .substring(1, 7),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: "Metropolis",
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  item.price.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 16,
                                                    fontFamily: "Metropolis",
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const SizedBox(
                                                      width: 40,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      height: 35,
                                                      width: 100,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                cc.incrise(
                                                                    index);
                                                              },
                                                              child: const Icon(
                                                                  Icons.add)),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(item.quantity
                                                              .toString()),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          12),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  cc.decrise(
                                                                      index);
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .minimize),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              }),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Column(
                                children: [
                                  const Text(
                                    "TOTAL",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GetBuilder<CartController>(builder: (cc) {
                                    return Text(
                                      cc.price.round().toString(),
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("cc.product");
                              },
                              child: Container(
                                width: 170,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'CHECK OUT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
            }));
  }
}



// Column(
//       children: [
//         Expanded(
//             child: SafeArea(
//           child: CustomScrollView(
//             slivers: [
//               const SliverAppBar(
//                 pinned: true,
//                 expandedHeight: 160.0,
//                 collapsedHeight: 60.0,
//                 flexibleSpace: FlexibleSpaceBar(
//                   centerTitle: F,
//                   stretchModes: [StretchMode.fadeTitle],
//                   title: Text(
//                     "My cart",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 25,
//                       fontFamily: "Metropolis",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 backgroundColor: Colors.white,
//               ),
//               GetBuilder<CartController>(
//                   init: CartController(),
//                   builder: (cc) {
//                     final items = cc.product!;
//                     return SliverList(
//                       delegate: SliverChildBuilderDelegate((context, index) {
//                         final item = cc.product![index];

//                         return Dismissible(
//                             key: Key(cc.product!.toString()),
//                             direction: DismissDirection.endToStart,
//                             onDismissed: (dirction) {
//                               items.removeAt(index);
//                               print(item.Productid!);
//                               cc.dellProduct(item.Productid!.toInt());
//                             },
//                             child: Card(
//                               color: Colors.white,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15, vertical: 5),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(
//                                       height: 100,
//                                       child: Image.network(
//                                         item.image.toString(),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 30,
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           item.title.toString().substring(1, 7),
//                                           overflow: TextOverflow.ellipsis,
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontFamily: "Metropolis",
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           item.price.toString(),
//                                           style: const TextStyle(
//                                             color: Colors.orange,
//                                             fontSize: 16,
//                                             fontFamily: "Metropolis",
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             const SizedBox(
//                                               width: 40,
//                                             ),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   color: Colors.grey.shade300,
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           10)),
//                                               height: 35,
//                                               width: 100,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 children: [
//                                                   GestureDetector(
//                                                       onTap: () {
//                                                         cc.incrise(index);
//                                                       },
//                                                       child: const Icon(
//                                                           Icons.add)),
//                                                   const SizedBox(
//                                                     width: 15,
//                                                   ),
//                                                   Text(
//                                                       item.quantity.toString()),
//                                                   const SizedBox(
//                                                     width: 15,
//                                                   ),
//                                                   Container(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               bottom: 12),
//                                                       child: GestureDetector(
//                                                         onTap: () {
//                                                           cc.decrise(index);
//                                                         },
//                                                         child: const Icon(
//                                                             Icons.minimize),
//                                                       )),
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ));
//                       }, childCount: cc.product!.length),
//                     );
//                   }),
//             ],
//           ),
//         )),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 50,
//               child: Column(
//                 children: [
//                   const Text(
//                     "TOTAL",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   GetBuilder<CartController>(builder: (cc) {
//                     return Text(
//                       cc.totalprice.toString(),
//                       style: const TextStyle(
//                         color: Colors.orange,
//                         fontSize: 19,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     );
//                   })
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 print("cc.product");
//               },
//               child: Container(
//                 width: 170,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Icon(
//                       Icons.shopping_cart_outlined,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       'CHECK OUT',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     )