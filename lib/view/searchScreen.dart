import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/searchPage_viewmodel.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';
import 'package:store_app/view/widgets/productListView.dart';
import 'package:store_app/view/widgets/product_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  SearchPageControllar cc = Get.put(SearchPageControllar());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    Expanded(
                      child: CustomTextField(
                        onSave: (val) {
                          cc.name = val ?? "";
                        },
                        text: "search",
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Filter_DIALOG();
                        },
                        icon: const Icon(Icons.tune))
                  ],
                ),
              ),
              Obx(() {
                if (!cc.loading.value) {
                  return Expanded(
                    child: cc.product != null
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 260,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 10),
                            itemCount: cc.product?.length,
                            itemBuilder: (c, index) {
                              List<ProductData>? data = cc.product;
                              return SizedBox(
                                height: 600,
                                child: product_card(product: data![index]),
                              );
                            })
                        : const Text("no data"),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
            ],
          ),
        ),
      ),
    );
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
                    cc.category = val ?? "";
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.download),
                  text: "min price",
                  onSave: (val) {
                    cc.min = int.parse(val ?? "0");
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.upgrade_rounded),
                  text: "max price",
                  onSave: (val) {
                    cc.max = int.parse(val ?? "10000");
                  },
                  type: TextInputType.emailAddress,
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
        print("ssssdfffaaa");
        formkey.currentState!.save();
        cc.SearchProduct();
        Get.back();
      },
      textConfirm: "Search",
    );
  }
}
