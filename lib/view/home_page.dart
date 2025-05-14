// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/viewmodel/categoryController.dart';
import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/view/UserPage.dart';
import 'package:store_app/view/itemDetail%20.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';
import 'package:store_app/view/widgets/productListBuilder.dart';
import 'package:store_app/view/widgets/product_item.dart';
import 'package:store_app/view/widgets/catogoreWidget.dart';

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
            // const SliverToBoxAdapter(
            //   child: Text(
            //     "Category",
            //     style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // const SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 20,
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 130,
            //     width: double.infinity,
            //     child: Obx(() {
            //       if (!cc.loading.value) {
            //         List<String> cat = cc.extractcategory(cc.product!);
            //         return true
            //             ? ListView.builder(
            //                 scrollDirection: Axis.horizontal,
            //                 itemCount: cat.length,
            //                 itemBuilder: (BuildContext, i) {
            //                   return catogore(name: cat[i].toString());
            //                 },
            //               )
            //             : const Center(child: Text("no data"));
            //       } else {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //     }),
            //   ),
            // ),
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
  final formkey = GlobalKey<FormState>();

  List<ProductData> filter = [];
  HomeControllar cc;
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
      IconButton(
        icon: const Icon(Icons.tune),
        onPressed: () {
          Filter_DIALOG();
        },
      ),
    ];
  }

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
    if (query != "") {
      if (cc.category == null) {
        filter = cc.product!
            .where((element) =>
                element.name.toLowerCase().startsWith(query.toLowerCase()) &&
                element.price <= cc.max &&
                element.price >= cc.min &&
                query.isNotEmpty)
            .toList();
      } else {
        filter = cc.product!
            .where((element) =>
                element.name.toLowerCase().startsWith(query.toLowerCase()) &&
                element.price <= cc.max &&
                element.price >= cc.min &&
                element.category
                    .toLowerCase()
                    .startsWith(cc.category.toString()) &&
                query.isNotEmpty)
            .toList();
      }
      return buildResuilt(filter: filter);
    } else {
      return buildResuilt(filter: cc.product!);
    }
    // if (query != "") {
    //   filter = cc.product!
    //       .where((element) => element.title!.startsWith(query))
    //       .toList();
    //   return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
    //     SliverGrid(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           mainAxisExtent: 260,
    //           mainAxisSpacing: 20,
    //           crossAxisSpacing: 10),
    //       delegate: SliverChildBuilderDelegate(
    //           (context, index) => product_card(
    //                 product: filter[index],
    //               ),
    //           childCount: filter.length),
    //     )
    //   ]);
    // } else {
    //   return SizedBox(
    //     height: 1,
    //   );
    // }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != "") {
      filter = cc.product!
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

  Future<dynamic> Filter_DIALOG() {
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
                    cc.category = val;
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
                    cc.min = x;
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
                    cc.min = x;
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

        Get.back();
      },
      textConfirm: "ok",
    );
  }
}

class buildResuilt extends StatelessWidget {
  buildResuilt({
    super.key,
    required this.filter,
  });

  final List<ProductData> filter;
  List<String> titles = ['category', 'price'];
  List<int>? filterIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10),
              itemCount: filter.length,
              itemBuilder: (c, index) {
                return SizedBox(
                  height: 600,
                  child: product_card(
                    product: filter[index],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
