import 'package:estibafy_company_app/UI/widgets/backButton.dart';
import 'package:estibafy_company_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import '../../controllers/animationsController.dart';
import '../../controllers/auth_controller.dart';
import '../../theme/colors.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final animationController = Get.put(Animate());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    animationController.startAnimation();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            backButton(),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "Forgot Password",
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text("Please enter your email we will send you \nemail for password",
                style: subtitleTextStyle),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
              child: TextFormField(
                controller: authController.forgotPasswordController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Email",
                  hintText: 'your-email@domain.com',
                  labelStyle: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Obx(
                () => SlideTransition(
                  position: animationController.slideFromRight.value,
                  child: ClipPath(
                    clipper: OvalLeftBorderClipper(),
                    child: Container(
                      height: 70,
                      width: 250,
                      color: AppColors.primaryColor,
                      child: Center(
                        child: Text(
                          'Next',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
