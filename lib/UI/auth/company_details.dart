import 'dart:io';

import 'package:estibafy_company_app/UI/auth/companyAddress.dart';
import 'package:estibafy_company_app/UI/widgets/backButton.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import '../../components/components.dart';
import '../../controllers/animationsController.dart';
import '../../controllers/auth_controller.dart';

class CompanyCreateDetailScreen extends StatefulWidget {
  CompanyCreateDetailScreen({Key? key}) : super(key: key);

  @override
  State<CompanyCreateDetailScreen> createState() => _CompanyCreateDetailScreenState();
}

class _CompanyCreateDetailScreenState extends State<CompanyCreateDetailScreen> {
  final authController = Get.put(AuthController());

  final animationController = Get.put(Animate());

  final _formKey = GlobalKey<FormState>();

  File? image;
  bool imageSelected = false;

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
                    height: MediaQuery.of(context).size.height * .25,
                    width: double.infinity,
                    color: AppColors.primaryColor.withOpacity(0.6),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'COMPANY DETAILS',
                            style: titleTextStyle.copyWith(color: AppColors.backgroundColor),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Add your company details',
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _imgFromGallery();
                            },
                            child: Container(
                               height: 120,
                               width: 120,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: AppColors.primaryColor,
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(2.0),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(100),
                                   child: Container(
                                     child: image == null
                                         ? const Icon(Icons.camera_alt_outlined, color: Colors.white,)
                                         : Image(
                                             image: FileImage(image!),
                                             alignment: Alignment.topCenter,
                                             fit: BoxFit.cover,
                                           ),
                                   ),
                                 ),
                               ),
                             ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: authController.companyName,
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
                                Icons.factory_rounded,
                                color: AppColors.primaryColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Company Name",
                              hintText: 'Soft Tech',
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
                            controller: authController.rucOfCompany,
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
                                Icons.credit_card_sharp,
                                color: AppColors.primaryColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "R.U.C",
                              hintText: '',
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
                            controller: authController.companyContact,
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
                                Icons.contact_phone,
                                color: AppColors.primaryColor,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Company Contact",
                              hintText: '+0000000000',
                              labelStyle: TextStyle(color: AppColors.primaryColor),
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.close,
                              //         color: Colors.purple))
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MaterialButton(
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              color: AppColors.primaryColor,
                              minWidth: double.maxFinite,
                              // padding: EdgeInsets.only(
                              //     left: 120, right: 120, top: 20, bottom: 20),

                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(CompanyCreateAddressScreen(
                                    image: image!,
                                  ));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(
                                  'NEXT',
                                  style: buttonTextStyle,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
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
    );
  }

  _imgFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false, type: FileType.custom, allowedExtensions: ['png', 'jpg','jpeg']);
    image = File(result!.files.single.path!);
    authController.userImage.value = image!;
    print("groupImage" + image.toString());
    setState(() {});
  }
}
