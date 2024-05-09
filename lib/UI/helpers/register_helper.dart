import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../controllers/helper_controller.dart';
import '../../services/goole_place_search/google_places_web.dart';
import '../../theme/colors.dart';
import '../widgets/backButton.dart';

class RegisterHelpers extends StatelessWidget {
   RegisterHelpers({super.key});
  
  final helperController = Get.put(HelperController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "register helper".toUpperCase(),
                    style: titleTextStyle.copyWith(color: AppColors.whiteColor),
                  ),
                  Text('Please enter Helper Detail',
                      style: subtitleTextStyle.copyWith(color: AppColors.whiteColor)),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: helperController.helperName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
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
                      labelText: "Helper Name",
                      hintText: 'John Wick',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: helperController.helperEmail,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
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
                      hintText: 'john@domain.com',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: helperController.helperMobile,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
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
                          helperController.countryCode.value = c.code!;
                        },
                        initialSelection: helperController.countryCode.value,
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Contact",
                      hintText: '987654321',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                      // suffixIcon: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.close,
                      //         color: Colors.purple))
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlutterGooglePlacesWeb(
                    apiKey: "AIzaSyCetgXGpC7IHj3AFOA0w1gCcWNSDIQn3nI",
                    required: true,
                    selectedResults: (value) {
                      helperController.helperStreetAddress.text =
                          value.streetAddress;
                      helperController.helperCity.text =
                          value.city;
                      helperController.helperState.text =
                          value.state;
                      helperController.helperCountry.text =
                          value.country;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.pin_drop_sharp,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Street Address",
                      hintText: '',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: helperController.helperCity,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "City",
                      hintText: 'New York',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: helperController.helperState,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.account_balance,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "State",
                      hintText: 'New York',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: helperController.helperCountry,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(
                        Icons.ac_unit,
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Country",
                      hintText: 'USA',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      color: AppColors.whiteColor,
                      minWidth: double.maxFinite,
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          helperController.createHelper();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'REGISTER',
                          style: buttonTextStyle.copyWith(color: AppColors.blackColor),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: AppColors.whiteColor,
                          child: Center(child: backButton())),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
