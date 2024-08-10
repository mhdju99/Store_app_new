import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/AddressController.dart';
import 'package:store_app/core/viewmodel/homePage_viewmodel.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/view/itemDetail%20.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';

class AddressPage extends StatelessWidget {
  AddressPage({super.key});
  final formkey = GlobalKey<FormState>();

  AddressController cc = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: () {
            if (cc.Barnds.isEmpty) {
              ADD_SUPLAYER_DIALOG();
            }
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "My Address",
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
        body: Obx(() {
          return cc.Barnds.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " empty",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        child: ListView.builder(
                            itemCount: cc.Barnds.length,
                            itemBuilder: (c, index) {
                              final item = cc.Barnds[index];

                              return Container(
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.grey.shade300)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          item.type,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: "Metropolis",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(9),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.city,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Metropolis",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            item.adress,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: "Metropolis",
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.phone,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Metropolis",
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        title: ' Alert',
                                                        middleText:
                                                            'delete address ?',
                                                        onConfirm: () {
                                                          cc.del(item.phone);

                                                          Get.back();
                                                          // cc.del(listofitem[index].suplayerID!);
                                                        },
                                                        textConfirm: 'yes',
                                                        confirmTextColor:
                                                            Colors.amberAccent,
                                                        textCancel: 'no');
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      )),
                    ],
                  ),
                );
        }));
  }

  Future<dynamic> ADD_SUPLAYER_DIALOG() {
    return Get.defaultDialog(
      title: "ADD ADDRESS",
      content: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  prefixIcon: const Icon(Icons.merge_type_sharp),
                  text: "type",
                  onSave: (val) {
                    cc.type = val;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.location_city_outlined),
                  text: "city",
                  onSave: (val) {
                    cc.city = val;
                  },
                  type: TextInputType.emailAddress,
                  // validate: (e) {
                  //   return authControlar.validateEmail(e);
                  // },
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.pin_drop_outlined),

                  onSave: (val) {
                    cc.adress = val;
                  },
                  // validate: (e) {
                  //   return cc.validatePassword(e);
                  // },
                  text: "address",
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  prefixIcon: const Icon(Icons.phone),
                  text: "phone",
                  onSave: (val) {
                    cc.phone = val;
                  },
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
        if (formkey.currentState!.validate()) {
          print("object");
          cc.add();
        } else {
          Get.snackbar("error", " error in username or password");
        }
        Get.back();
      },
      textCancel: "Undo",
      textConfirm: "ADD",
    );
  }
}
