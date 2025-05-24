import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/controllers/landing_viewmodel.dart';
import 'package:store_app/controllers/userController.dart';
import 'package:store_app/view/AddressPage.dart';
import 'package:store_app/view/screens/home_page.dart';
import 'package:store_app/view/screens/onBorder.dart';
import 'package:store_app/view/screens/wishlistPge.dart';

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
            "My profile",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 37,
              fontFamily: "Metropolis",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.grey[200],
            child: SizedBox(
              height: 90,
              child: ListTile(
                leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/person.png")),
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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.grey[200],
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      // Get.to(MyOredr());
                    },
                    child: const ListTile(
                      leading: Icon(Icons.task_alt_sharp),
                      title: Text(
                        "My Order",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () => Get.to(AddressPage()),
                  child: const SizedBox(
                    height: 40,
                    child: ListTile(
                      leading: Icon(Icons.pin_drop),
                      title: Text(
                        "My Address",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(wishlist());
                  },
                  child: const SizedBox(
                    height: 50,
                    child: ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text(
                        "wishlist",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: 343,
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(211, 38, 38, 0.25),
                        spreadRadius: 1,
                        blurRadius: 9,
                        blurStyle: BlurStyle.solid)
                  ],
                  border: Border.all(color: Colors.red)),
              child: MaterialButton(
                disabledColor: Colors.amber,

                // padding:
                //     const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                onPressed: () {
                  ll.tabIndex = 0;
                  ll.currentTab = const HomePage();
                  Get.offAll(() => const OnBoard());
                },

                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log Out  ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
