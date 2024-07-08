import 'dart:convert';

import 'package:estibafy_company_app/API/api_service.dart';
import 'package:estibafy_company_app/UI/Orders/orders_screen.dart';
import 'package:estibafy_company_app/UI/widgets/show_message.dart';
import 'package:estibafy_company_app/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../UI/Orders/order_detail_screen.dart';
import '../UI/helpers/all_helpers.dart';
import '../models/company_helpers.dart';

class HelperController extends GetxController {
  Rx<HelperModel> helpers = HelperModel().obs;

  RxList<Helper> assignHelpers = <Helper>[].obs;

  TextEditingController helperName = TextEditingController();
  TextEditingController helperEmail = TextEditingController();
  TextEditingController helperMobile = TextEditingController();
  TextEditingController helperPassword = TextEditingController();
  TextEditingController helperConfirmPassword = TextEditingController();
  TextEditingController helperCity = TextEditingController();
  TextEditingController helperStreetAddress = TextEditingController();
  TextEditingController helperState = TextEditingController();
  TextEditingController helperCountry = TextEditingController();

  RxString helperImage = "".obs;
  RxString countryCode = "EC".obs;

  final authController = Get.put(AuthController());

  getAllHelpers() {
    API().getRequest(endPoint: "/company/helpers").then((value) {
      if (value != null) {
        try{
          helpers.value = HelperModel.fromJson(value.data);
          update();
        }catch(e){
          print(e);
        }
      }
    });
  }

  void addHelper(Helper helper) {
    assignHelpers.add(helper);
    refresh();
  }

  void removeHelper(Helper helper) {
    assignHelpers.removeWhere((element) => helper.id == element.id);
    refresh();
  }

  createHelper() {
    var body = {
      "name": helperName.text,
      "email": helperEmail.text,
      "mobile": helperMobile.text,
      "password": '123456',
      "password_confirm": '123456',//helperConfirmPassword.text,
      "latitude": "",
      "longitude": "",
      "apartment": "2",
      "city": helperCity.text,
      "country": helperCountry.text,
      "province": helperState.text,
      // "image": "",
      // "company_id": authController.userProfile.value.data?.user?.company?.userId ?? 0
    };

    API()
        .postRequest(endPoint: '/company/helper-add', body: body, dataType: 'form-data')
        .then((value) {
      if (value != null) {
        ShowMessage().showMessage("${helperName.text} registered as a Helper");
        Get.to(AllHelpersScreen());
      }
    });
  }

  assignHelper({int? jobId}){
    var helperIds = [];
    for(var helper in assignHelpers){
      helperIds.add(helper.id);
    }
    var body = {
      "status" : "inprocess",
      "job_id": jobId.toString(),
      "helpers": jsonEncode(helperIds)
    };

    API().postRequest(endPoint: '/company/helpers/assign',body: body,dataType: "form-data").then((value) {
      if(value != null){
        if(value.statusCode == 200){
          var result = jsonDecode(value.data);
          ShowMessage().showMessage(result);
        }
      }
    });
  }

  deleteHelper(int? helperId){
    print(helperId);
    API().getRequest(endPoint: '/company/helper-delete/$helperId').then((value) {
      if(value != null){
        if(value.statusCode == 200){
          ShowMessage().showMessage("Helper Deleted");
          Get.to(AllHelpersScreen());
        }
      }
    });
  }

}
