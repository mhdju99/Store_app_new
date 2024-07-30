import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
import 'package:store_app/core/viewmodel/landing_viewmodel.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/view/home_page.dart';
import 'package:store_app/view/onBorder.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  AuthenticationManager cc = Get.find();
  LandingPageController ll = Get.find();
  userController uu = Get.put(userController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListView(
        children: [
          const Text(
            "My profail",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 37,
              fontFamily: "Metropolis",
              fontWeight: FontWeight.w700,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&psig=AOvVaw2gXPwJdvgEfLYFq3TDZlEe&ust=1717634093324000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLihk-Kbw4YDFQAAAAAdAAAAABAE"),
            ),
            title: Text(
              uu.name ?? ".",
              style: const TextStyle(
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              uu.email ?? ".",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Card(
            elevation: 3,
            color: Color.fromARGB(255, 196, 202, 220),
            child: ListTile(
              title: Text(
                "Shiping address",
                style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          const Card(
            color: Color.fromARGB(255, 196, 202, 220),
            child: ListTile(
              title: Text(
                "Promo code",
                style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          const Card(
            color: Color.fromARGB(255, 196, 202, 220),
            child: ListTile(
              title: Text(
                "Promo code",
                style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          const Card(
            color: Color.fromARGB(255, 196, 202, 220),
            child: ListTile(
              title: Text(
                "Promo code",
                style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              chaild: const buttonText(label: "logout"),
              onPressed: () {
                // cc.logOut();
                ll.tabIndex = 0;
                ll.currentTab = const HomePage();
                Get.offAll(() => const OnBoard());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
