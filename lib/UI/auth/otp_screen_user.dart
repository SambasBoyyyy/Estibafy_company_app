import 'dart:async';

import 'package:estibafy_company_app/controllers/animationsController.dart';
import 'package:estibafy_company_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../components/components.dart';
import '../../theme/colors.dart';
import '../widgets/backButton.dart';
import 'forgotPassword.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final authController = Get.put(AuthController());

  final animationController = Get.put(Animate());
  final autController = Get.put(AuthController());

  final pinController = TextEditingController();
  final focusNode = FocusNode();

  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });

    super.initState();
    animationController.startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            image: const DecorationImage(
              image: AssetImage('assets/images/bg.jpeg'),
              fit: BoxFit.cover,
              opacity: 0.5,
            )),
        child: Column(
          children: [
            Obx(
              () => SlideTransition(
                position: animationController.slideFromTop.value,
                child: ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    color: AppColors.primaryColor.withOpacity(0.6),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Verification',
                            style: titleTextStyle.copyWith(color: AppColors.backgroundColor),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Please Verify your Number',
                            style: titleTextStyle.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w300,
                                // height: 1.5,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Obx(
              () => SlideTransition(
                position: animationController.slideFromRight.value,
                child: Container(
                  // _formKey!.currentState!.validate() ? 200 : 600,
                  // height: isEmailCorrect ? 260 : 182,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'We have sent otp code to your\n '
                          'phone number ${authController.contactControllerSignup.text}',
                          style: TextStyle(color: AppColors.primaryColor, fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                          child: Obx(
                            () => Pinput(
                              controller: pinController,
                              focusNode: focusNode,
                              length: 6,
                              androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(30, 60, 87, 1),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                      color: authController.pinCodeSuccess.value
                                          ? AppColors.primaryColor
                                          : AppColors.redColor),
                                ),
                              ),
                              separatorBuilder: (index) => const SizedBox(width: 8),
                              validator: (value) {
                                return authController.pinCodeSuccess.value
                                    ? null
                                    : 'Pin is incorrect';
                              },
                              hapticFeedbackType: HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                FirebasePhoneAuth().verifyPhone(pin);
                              },
                              onChanged: (value) {
                                debugPrint('onChanged: $value');
                              },
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    width: 22,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              focusedPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.blueColor),
                                ),
                              ),
                              submittedPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(color: Colors.green),
                                ),
                              ),
                              errorPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: backButton(),
                            ),
                            const Spacer(),
                            Text("${secondsRemaining}"),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () async{
                                  await FirebasePhoneAuth()
                                      .sendSms(authController.countryCode.value +
                                          authController.contactControllerSignup.text)
                                      .then((value) {
                                        pinController.clear();
                                    setState(() {
                                      timer.reactive;
                                      enableResend = false;
                                      secondsRemaining = 60;
                                    });});
                                },
                                child: Text(
                                  "Resend",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: enableResend ? Colors.black : Colors.grey),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Obx(
              () => SlideTransition(
                position: animationController.slideFromBottom.value,
                child: ClipPath(
                  clipper: OvalTopBorderClipper(),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors.primaryColor.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Your Security more important for us',
                          style: TextStyle(
                            color: AppColors.backgroundColor.withOpacity(0.9),
                          ),
                        ),
                      ],
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
