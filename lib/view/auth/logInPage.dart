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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 44,
            ),
            const Text(
              "Log In",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 44,
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 44,
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
                            prefixIcon: const Icon(Icons.email),
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
                          Obx(() => CustomTextField(
                                suffixIcon: GestureDetector(
                                  onTap: () => authControlar.toggle(),
                                  child: Icon(authControlar.obscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                prefixIcon: const Icon(Icons.password_outlined),
                                initial: cc.getPassword(),
                                onSave: (val) {
                                  authControlar.password = val;
                                },
                                validate: (e) {
                                  return authControlar.validatePassword(e);
                                },
                                text: "Password",
                                type: authControlar.obscureText.value
                                    ? TextInputType.visiblePassword
                                    : null,
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetX<AuthController>(builder: (controlar) {
                    return CustomButton(
                        chaild: controlar.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const buttonText(label: "LogIn"),
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
                    "Don't have an account? ",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(SignUP());
                    },
                    child: const Text(
                      "Sign Up",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.red,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
