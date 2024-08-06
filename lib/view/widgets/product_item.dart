import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/models/product/product.dart';

import 'package:store_app/view/itemDetail%20.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/customText.dart';

class product_card extends StatelessWidget {
  HomeControllar cc = Get.put(HomeControllar());

  ProductData product;

  product_card({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ItemDetail3(data2: product));
      },
      child: Card(
        elevation: 7,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    product.imageCovered,
                    fit: BoxFit.fitWidth,
                    height: 170,
                    // cc.Barnds[index].Image!,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: CustomText(
                text: cc.FindBrand(product.brand!).toString(),
                fontSize: 14,
                coler: Colors.grey,
                wight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: CustomText(
                // text: cc.Barnds[index].BrandName!,
                text: product.title,
                fontSize: 18,
                wight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (product.repoInfo.price != null)
                      ?   ( product.repoInfo!.price! >75 )?Text(
                          "${product.repoInfo.price} s.p",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ): Text(
                              "Product Unavailable",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 12),
                            )
                      : const Text(
                          "Product Unavailable",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 12),
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
