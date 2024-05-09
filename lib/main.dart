import 'dart:convert';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:estibafy_company_app/UI/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/locals.dart';
import 'controllers/auth_controller.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCSy4lYveBpwUTmVuLji8OpWfA0Fw_EQ0c",
            appId: "1:295482206606:ios:f4040166d37857f94cdcdf",
            messagingSenderId: "295482206606",
            projectId: "estibafy-company-app"));
  } else {
    await Firebase.initializeApp();
  }

  SharedPreferences authLocal = await SharedPreferences.getInstance();
  bool newUser = (authLocal.getBool('loggedIn') ?? true);
  if (newUser == false) {
    final authController = Get.put(AuthController());
    var data = jsonDecode(authLocal.getString("user").toString());
    authController.ifAlreadyLoggedIn(data);
  }

  runApp( Main(isNewUser: newUser,));
}

class Main extends StatelessWidget {
  const Main({Key? key, required this.isNewUser}) : super(key: key);

  final bool isNewUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: locals,
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
      home: SplashScreen(isNewUser: isNewUser,),
      builder: EasyLoading.init());
  }
}
