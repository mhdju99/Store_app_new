import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/forgetPassword_viewmodel.dart';
import 'package:store_app/view/screens/logInPage.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class Newpassword extends StatelessWidget {
  Newpassword({super.key});
  forgetPasswordControllar cc = Get.put(forgetPasswordControllar());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create New password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                "This password should be different from the previous password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w400,
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
                              prefixIcon: const Icon(Icons.lock_outline),
                              // initial: cc.getemail(),
                              text: "New Password",
                              onSave: (val) {
                                cc.password = val;
                              },
                              type: TextInputType.visiblePassword,
                              validate: (e) {
                                return cc.validatePassword(e);
                              },
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            CustomTextField(
                              prefixIcon: const Icon(Icons.lock_outline),
                              // initial: cc.getemail(),
                              text: "Reset password",
                              onSave: (val) {
                                // authControlar.email = val;
                              },
                              type: TextInputType.visiblePassword,
                              validate: (e) {
                                return cc.confirmPassword(e, cc.password);
                              },
                            ),
                            const SizedBox(
                              height: 7,
                            ),
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
                    GetX<forgetPasswordControllar>(builder: (controlar) {
                      return CustomButton(
                          chaild: controlar.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const buttonText(label: "change Password"),
                          onPressed: () {
                            // Get.to(const Inputemail());

                            formkey.currentState!.save();
                            if (formkey.currentState!.validate()) {
                              cc.resetPassword();
                            }
                          });
                    }),
                    const SizedBox(
                      height: 60,
                    ),
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
