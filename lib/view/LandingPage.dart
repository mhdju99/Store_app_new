import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/landing_viewmodel.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  LandingPageController lading =
      Get.put(LandingPageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(
        init: LandingPageController(),
        builder: (controlar) => WillPopScope(
              onWillPop: lading.onWillPop,
              child: Scaffold(
                  body: controlar.currentTab,
                  bottomNavigationBar: BottomNavigationBar(
                    selectedFontSize: 14,
                    
                    selectedIconTheme: const IconThemeData(size: 19),
                    showUnselectedLabels: true,
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.grey.shade600,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home_outlined,
                            size: 30,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          label: "Search"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            size: 30,
                          ),
                          label: "Cart"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.person_2_outlined,
                            size: 30,
                          ),
                          label: "Profile"),
                    ],
                    currentIndex: controlar.tabIndex,
                    onTap: (index) {
                      controlar.changTabIndex(index);
                      controlar.changPage(index);
                    },
                  )),
            ));
  }
}
