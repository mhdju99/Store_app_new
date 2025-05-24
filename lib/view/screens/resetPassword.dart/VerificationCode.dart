import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:store_app/controllers/forgetPassword_viewmodel.dart';
import 'package:store_app/view/screens/resetPassword.dart/newPassword.dart';
import 'package:store_app/view/widgets/CustomButton.dart';
import 'package:store_app/view/widgets/buttonText.dart';

class Verificationcode extends StatelessWidget {
  Verificationcode({super.key});
  forgetPasswordControllar cc = Get.put(forgetPasswordControllar());

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
                "Verification",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Please enter 6 digit code your received in your email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Form(
                        // key: formkey,
                        child: Column(
                          children: [
                            OtpTextField(
                              numberOfFields: 6,
                              borderColor: const Color(0xFF512DA8),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                cc.code = verificationCode;
                              }, // end onSubmit
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomButton(
                                chaild: const buttonText(label: "Verify"),
                                onPressed: () {
                                  // Get.to(const Newpassword());
                                  cc.verfiycode();

                                  // formkey.currentState!.save();
                                  // if (formkey.currentState!.validate()) {
                                  //   controlar.isLoading.value = true;
                                  //   cc.saveUser(authControlar.email,
                                  //       authControlar.password);
                                  //   authControlar.login();
                                  // } else {
                                  //   Get.snackbar("error",
                                  //       " error in username or password");
                                  // }
                                })
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Didn't receive any code? ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cc.getcode();
                      },
                      child: const Text(
                        "Resend new code",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
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
