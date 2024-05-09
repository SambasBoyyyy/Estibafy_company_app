import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:estibafy_company_app/API/api_service.dart';
import 'package:estibafy_company_app/UI/navBar.dart';
import 'package:estibafy_company_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../UI/auth/loginScreen.dart';
import '../UI/widgets/show_message.dart';

class AuthController extends GetxController {
  Rx<UserModel> userProfile = UserModel().obs;

  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();

  TextEditingController emailControllerSignup = TextEditingController();
  TextEditingController passwordControllerSignup = TextEditingController();
  TextEditingController confirmPasswordControllerSignup = TextEditingController();
  TextEditingController contactControllerSignup = TextEditingController();
  TextEditingController nameControllerSignup = TextEditingController();
  RxString countryCode = '+593'.obs;
  Rx<File> userImage = File('').obs;

  TextEditingController companyName = TextEditingController();
  TextEditingController rucOfCompany = TextEditingController();
  TextEditingController companyContact = TextEditingController();
  TextEditingController companyAddress = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  TextEditingController forgotPasswordController = TextEditingController();

  RxBool showPassword = true.obs;

  RxBool signUPShowPassword = true.obs;
  RxBool signUPShowConfirmPassword = true.obs;

  RxBool pinCodeSuccess = true.obs;

  late SharedPreferences authLocal;

  void ifAlreadyLoggedIn(var data) {
    userProfile.value = UserModel.fromJson(data);
  }

  login() {
    var body = {
      "email": emailControllerLogin.text,
      "password": passwordControllerLogin.text,
    };

    API().postRequest(endPoint: "/login", body: body, dataType: "json").then((value) async {
      if (value != null) {
        print(value.data['status']);
        if (value.data['status'] == 200) {
          authLocal = await SharedPreferences.getInstance();
          try {
            userProfile.value = UserModel.fromJson(value.data);
            authLocal.setString("user", jsonEncode(userProfile.value));
            authLocal.setBool("loggedIn", false);
            userProfile.refresh();
            Get.offAll(() => MainNav());
          } catch (e) {
            log(e.toString());
          }
        } else {
          ShowMessage().showErrorMessage("${value.data['message']}");
        }
      }
    });
  }

  Future signup({File? image}) async {
    var value = await API().signUp(
        name: nameControllerSignup.text,
        mobile: "${countryCode.value}${contactControllerSignup.text}",
        password: passwordControllerSignup.text,
        email: emailControllerSignup.text,
        companyName: companyName.text,
        companyContact: companyContact.text,
        address:
            "${addressController.text}, ${cityController.text}, ${stateController.text}, ${countryController.text}",
        rucOfCompany: rucOfCompany.text,
        image: image!);
    if (value.data != null) {
      print(value.data['status']);
      if (value.data['status'] == 200) {
        authLocal = await SharedPreferences.getInstance();
        try {
          userProfile.value = UserModel.fromJson(value.data);
          authLocal.setString("user", jsonEncode(userProfile.value));
          authLocal.setBool("loggedIn", false);
          userProfile.refresh();
          Get.offAll(() => MainNav());
        } catch (e) {
          log(e.toString());
        }
      } else {
        ShowMessage().showErrorMessage("${value.data['message']}");
      }
    }
  }

  forgotPassword() {
    var body = {"email": forgotPasswordController.text};
    API().postRequest(endPoint: '/forgotPassword', body: body, dataType: 'json').then((value) {
      if (value!.statusCode == 200) {
        ShowMessage().showErrorMessage('Email Sent to ${forgotPasswordController.text}');
      }
    });
  }

  void onSignOut() async {
    authLocal = await SharedPreferences.getInstance();
    authLocal.setBool("loggedIn", true);
    authLocal.clear();
    Get.offAll(LoginScreen());
  }
}

String verificationID = '';

class FirebasePhoneAuth {
  Future<bool> sendSms(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'invalid-verification-code') {
        ShowMessage().showErrorMessage('Invalid Code try again!');
        return false;
      } else {
        EasyLoading.dismiss();
        ShowMessage().showErrorMessage('$e');
        return false;
      }
    }
  }

  Future<bool> verifyPhone(
    smsCode,
  ) async {
    EasyLoading.show();
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verificationID, smsCode: smsCode);
    final authController = Get.put(AuthController());
    try {
      final result = await FirebaseAuth.instance.signInWithCredential(credential);
      if (result.user != null) {
        authController.signup(image: authController.userImage.value);
        EasyLoading.dismiss();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'invalid-verification-code') {
        ShowMessage().showErrorMessage('Invalid Code');
      } else {
        EasyLoading.dismiss();
        ShowMessage().showErrorMessage('$e');
      }
    } catch (e) {
      EasyLoading.dismiss();
      ShowMessage().showErrorMessage('$e');
    }
    authController.pinCodeSuccess.value = true;
    return false;
  }
}
