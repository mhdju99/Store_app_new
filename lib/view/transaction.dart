import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/AddressController.dart';
import 'package:store_app/core/viewmodel/cart_viewmodel.dart';
import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/view/succssesPage%20copy.dart';
import 'package:store_app/view/succssesPage.dart';

class transactionPage extends StatelessWidget {
  transactionPage({super.key});

  CartController cc = Get.put(CartController());
  HomeControllar pp = Get.put(HomeControllar());
  AddressController aa = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "Transaction details",
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
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  " Product Ordered",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: cc.product.length,
                  itemBuilder: (c, index) {
                    final item = cc.product[index];

                    var product = pp.Findproduct(item.product.toString());
                    // print(items);

                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.network(product.imageCovered),
                        ),
                        title: Text(
                          product.title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Text(
                          "${cc.product[index].quantity.toString()} items",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Shipping Address",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      aa.Barnds[0].adress,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      aa.Barnds[0].city,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "\$${cc.totalprice.toString()} ",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Container(
                width: 343,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(211, 38, 38, 0.25),
                          spreadRadius: 1,
                          blurRadius: 9,
                          blurStyle: BlurStyle.solid)
                    ],
                    border: Border.all(color: Colors.red)),
                child: MaterialButton(
                  disabledColor: Colors.amber,

                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  onPressed: () {
                    Get.defaultDialog(
                        title: ' Alert',
                        middleText: 'Are you sure ?',
                        onConfirm: () async {
                          bool x = await cc.checkout(cc.CartID.toString());
                          if (x) {
                            Get.to(succssesPage());
                          } else {
                            Get.snackbar("title", "Error");
                          }
                        },
                        textConfirm: 'yes',
                        confirmTextColor: Colors.amberAccent,
                        textCancel: 'No');
                  },

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Checkout Now",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
