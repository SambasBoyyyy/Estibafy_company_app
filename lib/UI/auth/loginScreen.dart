import 'package:estibafy_company_app/UI/auth/signupScreen.dart';
import 'package:estibafy_company_app/controllers/animationsController.dart';
import 'package:estibafy_company_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../theme/colors.dart';
import 'forgotPassword.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());

  //final animationController = Get.put(Animate());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //animationController.startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            image: const DecorationImage(
              image: AssetImage('assets/images/bg.jpeg'),
              fit: BoxFit.cover,
              opacity: 0.5,
            )),
        child: Column(
          children: [
            // logo here
            // Image.asset(
            //   'assets/images/logo_new.png',
            //   height: 120
            //   width: 120,
            // ),
            ClipPath(
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
                          'Log In',
                          style: titleTextStyle.copyWith(color: AppColors.backgroundColor),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Estibafy Company App',
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
            Spacer(),
          Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                        child: TextFormField(
                          controller: authController.emailControllerLogin,
                          onChanged: (val) {},
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
                            labelText: "Email",
                            hintText: 'your-email@domain.com',
                            labelStyle: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Obx(
                          () => TextFormField(
                            controller: authController.passwordControllerLogin,
                            obscuringCharacter: '*',
                            obscureText: authController.showPassword.value,
                            decoration:  InputDecoration(
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
                                  onTap: (){
                                    authController.showPassword.value = !authController.showPassword.value;
                                  },
                                  child: authController.showPassword.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
                              fillColor: Colors.white,
                              labelText: "Password",
                              hintText: '**** at least 6',
                              labelStyle: const TextStyle(color: AppColors.primaryColor),
                            ),
                            validator: (value) {
                              if (value!.isEmpty && value.length < 6) {
                                return 'Enter a valid password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(horizontal: 131, vertical: 20)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authController.login();
                            }
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
            const Spacer(),
            ClipPath(
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
                        'You have\'t any account?',
                        style: TextStyle(
                          color: AppColors.backgroundColor.withOpacity(0.9),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppColors.backgroundColor, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
