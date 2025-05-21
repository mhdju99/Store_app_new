import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/controllers/landing_viewmodel.dart';
import 'package:store_app/controllers/userController.dart';
import 'package:store_app/view/screens/LandingPage.dart';
import 'package:store_app/view/screens/home_page.dart';
import 'package:store_app/view/screens/onBorder.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class succssesPage extends StatelessWidget {
  succssesPage({super.key});
  AuthenticationManager cc = Get.find();
  LandingPageController ll = Get.find();
  userController uu = Get.put(userController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Image.asset("assets/images/done.png"),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "your order has been placed",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Metropolis",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.done,
                size: 30,
                color: Colors.green,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.red)),
            child: MaterialButton(
              disabledColor: Colors.amber,

              // padding:
              //     const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              onPressed: () {
                  ll.tabIndex = 0;
                ll.currentTab = const HomePage();
                Get.offAll(() =>  LandingPage());
              },

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "shop again ",
                    style: TextStyle(color: Colors.black),
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
