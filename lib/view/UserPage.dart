import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  AuthenticationManager cc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&psig=AOvVaw2gXPwJdvgEfLYFq3TDZlEe&ust=1717634093324000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLihk-Kbw4YDFQAAAAAdAAAAABAE"),
                ),
                title: Text(
                  "My order",
                  style: TextStyle(
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text("hhhhhmod0@gmail.com"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Card(
                child: ListTile(
                  title: Text(
                    "Shiping address",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "Pyment method",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text(
                    "Promo code",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "hhhhhmod0@gmail.com",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text(
                    "Promo code",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "hhhhhmod0@gmail.com",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text(
                    "Promo code",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "hhhhhmod0@gmail.com",
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              CustomButton(
                chaild: const buttonText(label: "logout"),
                onPressed: () {
                  cc.logOut();
                },
              ),
            ],
          ),
        ));
  }
}
