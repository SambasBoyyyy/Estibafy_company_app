import 'package:estibafy_company_app/controllers/auth_controller.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/components.dart';
import '../widgets/backButton.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  backButton(),

                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CircleAvatar(
                              child: Image.network(
                                'https://i.pinimg.com/originals/be/c8/8c/bec88c0d89bca09ce2537257ee3fd054.jpg',
                                fit: BoxFit.fill,
                              ),
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.primaryColor),
                          child: const Icon(
                            LineAwesomeIcons.alternate_pencil,
                            color: AppColors.backgroundColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Company Details", style: titleTextStyle.copyWith(
                      fontSize: 14
                    )),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: authController.companyName,
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Company Name",
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: authController.rucOfCompany,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.directions_railway_rounded,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "R.U.C",
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: authController.companyAddress,
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.pin_drop,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Address",
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("User Details", style: titleTextStyle.copyWith(
                        fontSize: 14
                    )),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: authController.nameControllerSignup,
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "User Name",
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: authController.emailControllerSignup,
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.directions_railway_rounded,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Email",
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: authController.contactControllerSignup,
                    onChanged: (val) {},
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.call,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Contact",
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 131, vertical: 20)),
                      onPressed: () {},
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(fontSize: 17),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
