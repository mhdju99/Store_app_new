// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/controllers/cart_viewmodel.dart';
import 'package:store_app/controllers/homePage_viewmodel.dart';
import 'package:store_app/models/cart_data/cart_item.dart';
import 'package:store_app/utils/constants/end_points.dart';
import 'package:store_app/view/screens/succssesPage.dart';
import 'package:store_app/view/widgets/itemDetail%20.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  CartController cc = Get.put(CartController());
  HomeControllar pp = Get.put(HomeControllar());

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
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Obx(() {
              return cc.product.isEmpty
                  ? const EmptyCartView()
                  : CartItemListView();
            })));
  }
}

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/images/empty-cart.png"),
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
    );
  }
}

class CartItemListView extends StatelessWidget {
final CartController cc = Get.find<CartController>();
  CartItemListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      child: Column(
        children: [
          Expanded(
              child: Container(
            child: ListView.builder(
                itemCount: cc.product.length,
                itemBuilder: (c, index) {


                  final item = cc.product[index];

                  // var product =
                  //     pp.Findproduct(item.product.toString());
                  // print(items);

                  return CartItemCard(item: item, );
                }),
          )),
          CartTotalView()
        ],
      ),
    );
  }
}

class CartTotalView extends StatelessWidget {
   CartTotalView({
    super.key,
  });

 CartController cc = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  "\$${cc.price.round().toString()}",
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
            Get.defaultDialog(
                title: ' Alert',
                middleText: 'Are you sure ?',
                onConfirm: () async {
                  var state = await cc.checkout(cc.product);
                  if (state) {
                    Get.to(succssesPage());
                  } else {
                    Get.snackbar("title", "Error");
                  }
                },
                textConfirm: 'yes',
                confirmTextColor: Colors.amberAccent,
                textCancel: 'No');
          },
          child: Container(
            width: 170,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item;
 CartController cc = Get.find<CartController>();
   CartItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        background: slideRightBackground(),
        secondaryBackground: slideLeftBackground(),
        key: Key(item.product.id),
        // direction: DismissDirection.endToStart,

        onDismissed: (dirction) {
          cc.del(item);

          // items.removeAt(index);
          // print(item.Productid!);
          // cc.dellProduct(item.Productid.toString());
        },
        child: Card(
          color: Colors.grey[200],
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 65,
                  height: 65,
                  child: Image.network(
                    "${EndPoints.getimage_endpoint}?productId=${item.product.id}&imageName=${item.product.imagesNames[0]}.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ItemDetail3(product: item.product));
                      },
                      child: Text(
                        item.product.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 60,
                          child: Text(
                            item.size.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Text(
                          "\$${item.product.price.toString()}",
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          height: 35,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    cc.incrise(item, 1000);

                                    // cc.incrise(
                                    //     index);
                                  },
                                  child: const Icon(Icons.add)),
                              const SizedBox(
                                width: 15,
                              ),
                              GetBuilder<CartController>(builder: (cc) {
                                return Text(
                                  item.quantity.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: "Metropolis",
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              }),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                  // /${product.repoInfo.totalQuantity}
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: GestureDetector(
                                    onTap: () {
                                      cc.decrise(item);
                                    },
                                    child: const Icon(Icons.minimize),
                                  )),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
        ));
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.white,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
