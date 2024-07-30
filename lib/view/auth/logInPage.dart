import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
import 'package:store_app/core/viewmodel/auth_viewnodel.dart';
import 'package:store_app/view/auth/signUpPage.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final formkey = GlobalKey<FormState>();
  AuthenticationManager cc = Get.put(AuthenticationManager());

  AuthController authControlar = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Log In",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 37,
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          CustomTextField(
                            initial: cc.getemail(),
                            text: "Email",
                            onSave: (val) {
                              authControlar.email = val;
                            },
                            type: TextInputType.emailAddress,
                            validate: (e) {
                              return authControlar.validateEmail(e);
                            },
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          CustomTextField(
                            initial: cc.getPassword(),
                            onSave: (val) {
                              authControlar.password = val;
                            },
                            validate: (e) {
                              return authControlar.validatePassword(e);
                            },
                            text: "Password",
                            type: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(SignUP());
                        },
                        child: const Text(
                          "Don't have an account? ➡",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetX<AuthController>(builder: (controlar) {
                    return CustomButton(
                        chaild: controlar.isLoading.value
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : buttonText(label: "LogIn"),
                        onPressed: () {
                          formkey.currentState!.save();
                          if (formkey.currentState!.validate()) {
                            controlar.isLoading.value = true;
                            cc.saveUser(
                                authControlar.email, authControlar.password);
                       authControlar.login();
                   

                          } else {
                            Get.snackbar(
                                "error", " error in username or password");
                          }
                        });
                  }),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Or log in with social account",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Brand(Brands.google),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Brand(Brands.facebook)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
