import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/forgetPassword_viewmodel.dart';
import 'package:store_app/view/screens/resetPassword.dart/VerificationCode.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/CustomTextField.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class Inputemail extends StatelessWidget {
  Inputemail({super.key});
  final formkey = GlobalKey<FormState>();
  forgetPasswordControllar cc = Get.put(forgetPasswordControllar());
  String? email;
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Your Password?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      // key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Form(
                              key: formkey,
                              child: CustomTextField(
                                prefixIcon: const Icon(Icons.email_outlined),
                                text: "Email",
                                onSave: (val) {
                                  cc.email = val;
                                },
                                type: TextInputType.emailAddress,
                                validate: (e) {
                                  return cc.validateEmail(e);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            const Text(
                              "To recover yout password, please enter your email address",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            GetX<forgetPasswordControllar>(
                                builder: (controlar) {
                              return CustomButton(
                                  chaild: controlar.isLoading.value
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const buttonText(label: "Send"),
                                  onPressed: () {
                                    formkey.currentState!.save();

                                    if (formkey.currentState!.validate() &&
                                        cc.email != null) {
                                      cc.isLoading.value = true;
                                      cc.getcode();
                                    } else {
                                      Get.snackbar(
                                          "error", " email not correct");
                                    }
                                  });
                            })
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
                    const SizedBox(
                      height: 100,
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
