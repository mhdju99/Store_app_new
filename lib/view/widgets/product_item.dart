
import 'package:store_app/models/product/product.dart';

import 'package:store_app/view/itemDetail%20.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class product_card extends StatelessWidget {
  products product;

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
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Image.network(
                    product.image!,
                    fit: BoxFit.fitWidth,
                    height: 170,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red.shade600,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!.substring(1, 10),
                      ),
                      Text(product.category!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        product.price!.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                    ],
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
