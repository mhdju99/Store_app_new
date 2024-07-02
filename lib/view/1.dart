// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
// import 'package:store_app/core/viewmodel/CacheManager%20.dart';
// import 'package:store_app/view/widgets/CustomButton.dart';
// import 'package:store_app/view/widgets/buttonText.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   AuthenticationManager cc = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("home"),
//         ),
//         body: Center(
//             child: Column(
//           children: [
//             Text(
//               cc.getToken() ?? "dd",
//             ),
//             CustomButton(
//               chaild: buttonText(label: "logout"),
//               onPressed: () {
//                 cc.logOut();
//               },
//             ),
//           ],
//         )));
//   }
// }
