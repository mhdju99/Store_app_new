// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/models/product/product.dart';
import 'package:store_app/view/itemDetail%20.dart';
import 'package:store_app/view/widgets/productListBuilder.dart';
import 'package:store_app/view/widgets/product_item.dart';
import 'package:store_app/view/widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _pageOneState();
}

class _pageOneState extends State<HomePage> {
  List catogery = [
    {"icon": Icons.laptop, "name": "electronics"},
    // {"icon": Icons.phone_android, "name": "Phone"},
    // {"icon": Icons.gif_sharp, "name": "gift"},
    {"icon": Icons.watch, "name": "jewelery"},
    {"icon": Icons.man, "name": "men's clothing"},
    {"icon": Icons.woman, "name": "women's clothing"},
  ];

  HomeControllar cc = Get.put(HomeControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                    child: TextFormField(
                      enabled: F,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 40,
                        )),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                "Catogery",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catogery.length,
                  itemBuilder: (BuildContext, i) {
                    return catogore(
                        icon: catogery[i]["icon"], name: catogery[i]["name"]);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best salling",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        cc.refresh();
                      },
                      child: const Icon(Icons.refresh))
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
  List<products> filter = [];
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
          icon: const Icon(Icons.close))
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
      filter = cc.product!
          .where((element) => element.title!.contains(query))
          .toList();
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
          .where((element) => element.title!.contains(query))
          .toList();
      return ListView.builder(
          itemCount: filter.length,
          itemBuilder: (c, index) {
            return GestureDetector(
              onTap: () {
                Get.to(ItemDetail3(data2: filter[index]));
              },
              child: Card(
                child: ListTile(
                  title: Text(filter[index].title!.substring(1, 7)),
                  leading: Image.network(filter[index].image!),
                  subtitle: Text(
                    filter[index].price!.toString(),
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
            Container(
              height: 200,
              width: 200,
            
              child: Image.asset(
                "assets/images/search-product.png"
                 ),
            ),
            Text(
              "Serrch your product",
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
  const buildResuilt({
    super.key,
    required this.filter,
  });

  final List<products> filter;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
        });
  }
}
