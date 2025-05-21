import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/view/screens/logInPage.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();
    
    return LogIn();
    // Obx(() {

    //   return
    //   // authManager.isLogged.value ? LandingPage() :
    //    LogIn();
    // }
    // );
  }
}
