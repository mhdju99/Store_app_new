import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/view/screens/logInPage.dart';
import 'package:store_app/view/screens/splashScreen.dart';

class noConniction extends StatelessWidget {
  noConniction({Key? key}) : super(key: key);

  var kTitleTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 25,
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
  );

  var kSubtitleTextStyle = const TextStyle(
    color: Colors.black38,
    fontSize: 16,
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/connection_failed.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 230,
            left: 100,
            child: Text(
              'Connection Failed',
              style: kTitleTextStyle,
            ),
          ),
          Positioned(
            bottom: 170,
            left: 70,
            child: Text(
              'Your connection is offline,\nplease check your connection.',
              style: kSubtitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 130,
            right: 130,
            child: ReusablePrimaryButton(
              childText: 'Retry',
              buttonColor: Colors.green,
              childTextColor: Colors.white,
              onPressed: () {
                Get.offAll(SplashView());
              },
            ),
          ),
        ],
      ),
    );
    // Obx(() {

    //   return
    //   // authManager.isLogged.value ? LandingPage() :
    //    LogIn();
    // }
    // );
  }
}

class ReusablePrimaryButton extends StatelessWidget {
  const ReusablePrimaryButton({
    Key? key,
    required this.childText,
    required this.onPressed,
    required this.buttonColor,
    required this.childTextColor,
  }) : super(key: key);

  final String childText;
  final Function onPressed;
  final Color buttonColor;
  final Color childTextColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as VoidCallback,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor,
        ),
        child: Center(
            child: Text(
          childText.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            color: childTextColor,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
