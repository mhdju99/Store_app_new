import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/controllers/auth_viewnodel.dart';
import 'package:store_app/view/screens/resetPassword.dart/inputEmail.dart';
import 'package:store_app/view/screens/signUpPage.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44,
              ),
              const Text(
                "Sign in to your Account",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Container(
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
                              prefixIcon: const Icon(Icons.email_outlined),
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
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  // initial: cc.getPassword(),
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
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Inputemail());
                        authControlar.isOriginalContent = false.obs;
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurple,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
                              : const buttonText(
                                  label: "Sign in",
                                ),
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
                      height: 60,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: const Divider())),
                        const Text("OR"),
                        Expanded(
                            child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: const Divider(),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
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
                        Get.to(SignUP());
                        authControlar.isOriginalContent = false.obs;
                      },
                      child: const Text(
                        "Sign Up Now",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.purple,
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
      ),
    );
  }
}
