import 'package:store_app/utils/constants/end_points.dart';
import 'package:store_app/controllers/homePage_viewmodel.dart';
import 'package:store_app/models/poduct_model.dart';

import 'package:store_app/view/widgets/itemDetail%20.dart';

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
        Get.to(ItemDetail3(product: product));
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
                    "${EndPoints.getimage_endpoint}?productId=${product.id}&imageName=${product.imagesNames[0]}.jpg",
                    fit: BoxFit.fill,
                    width: double.infinity,

                    height: 170,
                    // cc.Barnds[index].Image!,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 11),
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
