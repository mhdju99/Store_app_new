import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/utils/class/connectionCheck.dart';
import 'package:store_app/view/screens/404.dart';
import 'package:store_app/view/screens/onBorder.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  SplashView({super.key});

  Future<void> initializeSettings() async {
    var x = _authmanager.conniction();
    _authmanager.checkLoginStatus();
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authmanager.conniction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else if(snapshot.hasData && snapshot.data == true) {
                      return const OnBoard();

        }
        else{
                                return  noConniction();

        }
        
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/g1.gif"),
            ),
          ),
          const Text('Loading...'),
        ],
      ),
    ));
  }
}
