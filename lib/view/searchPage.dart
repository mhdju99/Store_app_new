import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/searchImage_viewmodel%20.dart';
import 'package:store_app/view/widgets/product_item.dart';

class Searchpage extends StatelessWidget {
  Searchpage({super.key});
  SearchImageControllar cc = Get.put(SearchImageControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return cc.isOriginalContent.value
            ? _buildOriginalContent()
            : _buildNewContent();
      }),
    );
  }

  Widget _buildNewContent() {
    return Obx(() {
      if (!cc.loading.value) {
        return cc.product.isNotEmpty
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          cc.toggleContent();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: CircleAvatar(
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 260,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 10),
                        itemCount: cc.product.length,
                        itemBuilder: (c, index) {
                          return SizedBox(
                            height: 600,
                            child: product_card(
                              product: cc.product[index],
                            ),
                          );
                        }),
                  ),
                ],
              )
            : const Center(child: Text("no data"));
      } else {
        return Center(
            child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("assets/images/searching.gif"),
        ));
      }
    });
  }
}

Widget _buildOriginalContent() {
  return Center(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              SearchImageControllar cc = Get.put(SearchImageControllar());

              cc.toggleContent();

              cc.pickImage1();
            },
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/search-product.png"),
                  ),
                  const Text(
                    "Search product by image",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
  
}
