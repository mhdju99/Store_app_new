// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:store_app/controllers/homePage_viewmodel.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/utils/constants/end_points.dart';
import 'package:store_app/view/screens/UserPage.dart';
import 'package:store_app/view/screens/categoryLIstPage.dart';
import 'package:store_app/view/screens/searchScreen.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';
import 'package:store_app/view/widgets/catogoreWidget.dart';
import 'package:store_app/view/widgets/customText.dart';
import 'package:store_app/view/widgets/itemDetail%20.dart';
import 'package:store_app/view/widgets/productListBuilder.dart';
import 'package:store_app/view/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _pageOneState();
}

class _pageOneState extends State<HomePage> {
  HomeControllar cc = Get.put(HomeControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      child: RefreshIndicator(
        onRefresh: () async {
          cc.refresh();
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: search(cc: cc));
                      // Get.to(SearchScreen());
                    },
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(7.0),
                      child: TextFormField(
                        enabled: F,
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                      ),
                    ),
                  )),
                  InkWell(
                    onTap: () {
                      Get.to(UserPage());
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                      radius: 18,
                      child: Icon(
                        Icons.person_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Categorylistpage());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "View All",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.deepPurple,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
                width: double.infinity,
                child: Obx(() {
                  if (!cc.loadingAll.value) {
                    List<String> cat = cc.extractCategory(cc.Allproduct!);
                    return true
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext, i) {
                              return catogore(name: cat[i].toString());
                            },
                          )
                        : const Center(child: Text("no data"));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Products",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      cc.prevPage();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        cc.nextPage();
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                      ))
                  // GestureDetector(
                  //     onTap: () {
                  //       cc.refresh();
                  //     },
                  //     child: const Icon(Icons.refresh))
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            ProductListBuilder()
          ],
        ),
      ),
    ));
  }
}

class search extends SearchDelegate {
  List<ProductData> filter = [];
  HomeControllar cc;
  String? name, category;

  double min = 0.0, max = 10000;
  search({
    required this.cc,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
      // IconButton(
      //   icon: const Icon(Icons.tune),
      //   onPressed: () {
      //     Filter_DIALOG();
      //   },
      // ),
    ];
  }

  // List<ProductData> filterProducts(
  //     {String? query, String? category, double? min, double? max}) {
  //   return cc.Allproduct!.where((element) {
  //     bool matchesQuery = query == null ||
  //         element.name.toLowerCase().startsWith(query.toLowerCase());
  //     bool matchesCategory = category == null ||
  //         element.category.toLowerCase().startsWith(category.toLowerCase());
  //     bool matchesMin = min == null || element.price >= min;
  //     bool matchesMax = max == null || element.price <= max;
  //     return matchesQuery && matchesCategory && matchesMin && matchesMax;
  //   }).toList();
  // }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    cc.filterProducts(query: query, category: category, min: min, max: max);

    return buildResuilt(filter: cc.filterproductLIst,
      nameQ: query,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != "") {
      filter = cc.Allproduct!
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()) ||
              element.category.toLowerCase().contains(query.toLowerCase()) &&
                  query.length > 1)
          .toList();
      return ListView.builder(
          itemCount: filter.length,
          itemBuilder: (c, index) {
            return GestureDetector(
              onTap: () {
                Get.to(ItemDetail3(product: filter[index]));
              },
              child: Card(
                child: ListTile(
                  title: Text(filter[index].name),
                  leading: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ5A51DHb1thL0s0hX_-Bnk4oraNFEL-cPkA&s"),
                  //filter[index].imageCovered

                  subtitle: Text(
                    "${filter[index].price.toString()} s.p",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                ),
              ),
            );
          });
    } else {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/search-product.png"),
            ),
            const Text(
              "Search  product",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      );
    }
  }
}

class buildResuilt extends StatelessWidget {
  String nameQ;
  buildResuilt({
    Key? key,
    required this.nameQ,
    required this.filter,
  }) : super(key: key);

  final List<ProductData> filter;
  List<String> titles = ['category', 'price'];
  List<int>? filterIndex;
  HomeControllar cc = Get.put(HomeControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Filter_DIALOG();
        },
        label: const Text("Filter"),
        icon: const Icon(Icons.filter_list),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 220,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 8),
                    itemCount: filter.length,
                    itemBuilder: (c, index) {
                      return SizedBox(
                        height: 400,
                        child: product_card2(
                          product: cc.filterproductLIst[index],
                        ),
                      );
                    }),
              );
            }),
          ),
        ],
      ),
    );
  }

  Future<dynamic> Filter_DIALOG() {
    final formkey = GlobalKey<FormState>();
    String? name, category;

    double min = 0.0, max = 10000;
    return Get.defaultDialog(
      title: "filter",
      content: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  prefixIcon: const Icon(Icons.merge_type_sharp),
                  text: "category",
                  onSave: (val) {
                    category = val;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.download),
                  text: "min price",
                  onchange: (val) {
                    double? x = double.parse(val ?? "0.0");
                    min = x;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.upgrade_rounded),
                  text: "max price",
                  onchange: (val) {
                    double? x = double.parse(val ?? "10000");
                    max = x;
                    // cc.max = double.parse(val ?? "10000");
                  },
                  // validate: (e) {
                  //   return authControlar.validateEmail(e);
                  // },
                ),
                const SizedBox(
                  height: 7,
                ),
              ],
            ),
          ),
        ),
      ),
      onConfirm: () {
        formkey.currentState!.save();
        // cc.SearchProduct();
        cc.filterProducts(category: category,max: max,min: min,query: nameQ );
        Get.back();
      },
      textConfirm: "ok",
    );
  }
}

class product_card2 extends StatelessWidget {
  HomeControllar cc = Get.put(HomeControllar());

  ProductData product;

  product_card2({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ItemDetail3(product: product));
      },
      child: Card(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: const BoxDecoration(),
                width: double.infinity,
                height: 150,
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    "${EndPoints.getimage_endpoint}?productId=${product.id}&imageName=${product.imagesNames[0]}.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,

                    height: 160,
                    // cc.Barnds[index].Image!,
                  ),
                )),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: CustomText(
                // text: cc.Barnds[index].BrandName!,
                text: product.name,
                fontSize: 18,
                wight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$${product.price} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
