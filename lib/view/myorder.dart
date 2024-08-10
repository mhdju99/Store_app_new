import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/core/viewmodel/orderController.dart';

class MyOredr extends StatefulWidget {
  const MyOredr({super.key});

  @override
  State<MyOredr> createState() => _MyOredrState();
}

class _MyOredrState extends State<MyOredr> {
  orderController cc = Get.put(orderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "My order",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.pin_drop),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            cc.refresh();
          },
          child: Obx(() {
            if (!cc.loading.value) {
              return cc.Barnds.isNotEmpty
                  ? Expanded(
                      child: Container(
                        child: ListView.builder(
                            padding: const EdgeInsets.only(top: 20),
                            itemCount: cc.Barnds.length,
                            itemBuilder: (context, index) {
                              var item = cc.Barnds[index];
                              return InkWell(
                                onTap: () {
                                  HomeControllar pp = Get.put(HomeControllar());

                                  Get.defaultDialog(
                                      title: "order details",
                                      content: Column(
                                        children: [
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: item.cartItems!.length,
                                              itemBuilder: (c, indexs) {
                                                var oo =
                                                    item.cartItems![indexs];
                                                // print(items);

                                                return Container(
                                                  width: 400,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5,
                                                      vertical: 0),
                                                  child: ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    leading: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: Image.network(oo
                                                          .product!.imageCovered
                                                          .toString()),
                                                    ),
                                                    title: Text(
                                                      oo.product!.title
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            "Metropolis",
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                    trailing: Text(
                                                      "${oo.quantity} items",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            "Metropolis",
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "total :",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "Metropolis",
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "\$444",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 15,
                                                  fontFamily: "Metropolis",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(11)),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.grey.shade300)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(11)),
                                              ),
                                              height: 10,
                                              width: double.infinity,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            "Order # ",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  "Metropolis",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          Text(
                                                            item.id
                                                                .toString()
                                                                .substring(
                                                                    5, 10),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .deepPurple,
                                                              fontFamily:
                                                                  "Metropolis",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        item.createdAt
                                                            .toString()
                                                            .substring(0, 10),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              "Metropolis",
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "\$200",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.orange,
                                                          fontFamily:
                                                              "Metropolis",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            2,
                                                          ),
                                                          color: Colors.green,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(
                                                            item.status
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : const Center(child: Text("no data"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
