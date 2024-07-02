import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store_app/helper/db_helper.dart';
import 'package:store_app/models/cart_model.dart';

class CartController extends GetxController {
  // CartController() {
  //   // getallProduct();
  // }
  @override
  void onInit() {
    getallProduct();
    super.onInit();
  }

  List<Cart>? _product = [];
  double totalprice = 0;
  List<Cart>? get product => _product;

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  addProduct(Cart cart) async {
    int index =
        product!.indexWhere((element) => element.Productid == cart.Productid);
    if (index == -1) {
      Database? db = await Sqllite().insertData(cart);
      getallProduct();
    }
  }

  dellProduct(int id) async {
    Database? db = await Sqllite().deletData(id);
    update();
  }

  updateproduct(Cart cart) async {
    Database? db = await Sqllite().updatData(cart);
    update();
  }

  getallProduct() async {
    List<Cart>? db = await Sqllite().getAll();
    _product = db;
    print(db);
    print("ssssssssssssssaaaa");
    print(db!.length);

    update();
  }

  incrise(int index) {
    final x = product![index].quantity;
    if (x != null) {
      product![index].quantity = x + 1;

      update();
      updateproduct(product![index]);
    }
  }

  decrise(int index) {
    final x = product![index].quantity;
    if (x != null && x != 0) {
      product![index].quantity = x - 1;

      update();
      updateproduct(product![index]);
    }
  }

  double get price {
    return product!
        .fold(0, (sum, item) => sum + (item.price! * item.quantity!.toInt()));
  }

  bool get isempity => product!.isEmpty;
}
