import 'package:country_code_picker/country_code_picker.dart';
import 'package:estibafy_company_app/UI/auth/company_details.dart';
import 'package:estibafy_company_app/UI/auth/loginScreen.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import '../../components/components.dart';
import '../../controllers/animationsController.dart';
import '../../controllers/auth_controller.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final authController = Get.put(AuthController());

  final animationController = Get.put(Animate());

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController.startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpeg'), fit: BoxFit.cover, opacity: 0.4)),
        child: Column(
          children: [
            // logo here
            // Image.asset(
            //   'assets/images/logo_new.png',
            //   height: 120,
            //   width: 120,
            // ),
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
                            'Sign Up',
                            style: titleTextStyle.copyWith(color: AppColors.backgroundColor),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Register for Estibafy',
                            style: titleTextStyle.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w300,
                                // height: 1.5,
                                fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => SlideTransition(
                position: animationController.slideFromRight.value,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  // _formKey!.currentState!.validate() ? 200 : 600,
                  // height: isEmailCorrect ? 260 : 182,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: authController.nameControllerSignup,
                            validator: (value) {
                              if (value!.isEmpty) {
                            return '';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 1
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.primaryColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Full Name",
                              hintText: 'John Doe',
                              labelStyle: TextStyle(color: AppColors.primaryColor),
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.close,
                              //         color: Colors.purple))
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: authController.emailControllerSignup,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 1
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.email,
                                color: AppColors.primaryColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              hintText: 'your-email@domain.com',
                              labelStyle: TextStyle(color: AppColors.primaryColor),
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.close,
                              //         color: Colors.purple))
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: authController.contactControllerSignup,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                  fontSize: 1
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: CountryCodePicker(
                                enabled: true,
                                onChanged: (c) {
                                  print(c.dialCode!);
                                  print(c.code!);
                                  print(c.name!);
                                  authController.countryCode.value = c.dialCode!;
                                },
                                initialSelection: authController.countryCode.value,
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Contact",
                              hintText: '987654321',
                              labelStyle: const TextStyle(color: AppColors.primaryColor),
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.close,
                              //         color: Colors.purple))
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: authController.passwordControllerSignup,
                              obscuringCharacter: '*',
                              obscureText: authController.signUPShowPassword.value,
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    fontSize: 1
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.primaryColor,
                                ),
                                filled: true,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      authController.signUPShowPassword.value =
                                          !authController.signUPShowPassword.value;
                                    },
                                    child: authController.signUPShowPassword.value
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                fillColor: Colors.white,
                                labelText: "Confirm Password",
                                hintText: '**** at least 6',
                                labelStyle: const TextStyle(color: AppColors.primaryColor),
                              ),
                              onChanged: (val) {},
                              validator: (value) {
                                if (value!.isEmpty && value.length < 6) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: authController.confirmPasswordControllerSignup,
                              obscuringCharacter: '*',
                              obscureText: authController.signUPShowConfirmPassword.value,
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    fontSize: 1
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:  BorderRadius.all(Radius.circular(10))),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.primaryColor,
                                ),
                                filled: true,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      authController.signUPShowConfirmPassword.value =
                                          !authController.signUPShowConfirmPassword.value;
                                    },
                                    child: authController.signUPShowConfirmPassword.value
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                fillColor: Colors.white,
                                labelText: "Confirm Password",
                                hintText: '**** at least 6',
                                labelStyle: const TextStyle(color: AppColors.primaryColor),
                              ),
                              onChanged: (val) {},
                              validator: (value) {
                                if (value!.isEmpty && value.length < 6) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  backgroundColor: AppColors.primaryColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20)
                                  // padding: EdgeInsets.only(
                                  //     left: 120, right: 120, top: 20, bottom: 20),
                                  ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(CompanyCreateDetailScreen());
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 17, color: Colors.white),
                              ))
                        ],
                      ),
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
                      children: [
                        Text(
                          'Already have account?',
                          style: TextStyle(
                            color: AppColors.backgroundColor.withOpacity(0.9),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: AppColors.backgroundColor, fontWeight: FontWeight.w500),
                          ),
                        )
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
