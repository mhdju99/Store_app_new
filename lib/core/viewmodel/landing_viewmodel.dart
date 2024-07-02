import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/cart.dart';
import 'package:store_app/view/1.dart';
import 'package:store_app/view/home_page.dart';
import 'package:store_app/view/UserPage.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0;
  Widget currentTab =  HomePage();

  void changTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void changPage(int index) {
    switch (index) {
      case 0:
        currentTab =  HomePage();
        update();

        break;
      case 1:
        currentTab = Cart();
        update();

        break;
      case 2:
        currentTab = UserPage();
        update();

        break;
      default:
    }
    update();
  }
}
