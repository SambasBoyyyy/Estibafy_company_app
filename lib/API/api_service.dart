import 'dart:developer' as dev;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as cont;

import '../UI/widgets/show_message.dart';
import '../controllers/auth_controller.dart';

class API {
  String baseUrl = 'http://149.102.158.40/container/public/index.php/api';

  /// post function
  Future<Response?> postRequest({
    String? endPoint,
    var body,
    String? dataType,
    File? image,
  }) async {
    try {
      EasyLoading.show();

      Dio dio = Dio();

      var response;

      dio.options.headers["Authorization"] = getTokenHeader();

      FormData? formData;

      if (dataType == "form-data") {
        if (image != null) {
          Dio dioApi = Dio();
          dioApi.options.headers['content-type'] = 'multipart/form-data';
          formData = FormData.fromMap(body);
          print(formData);
          response = await dioApi.post(baseUrl + endPoint!, data: formData);
        } else {
          formData = FormData.fromMap(body);
          print(formData);
          response = await dio.post(baseUrl + endPoint!, data: formData);
        }
      } else {
        print(body);
        response = await dio.post(baseUrl + endPoint!, queryParameters: body);
      }

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return response;
      } else {
        ShowMessage().showErrorMessage("${response['message']}");
      }
    } on SocketException {
      ShowMessage().showErrorMessage("No Internet Connection");
      print('No Internet connection 😑');
      return null;
    } on HttpException {
      ShowMessage().showErrorMessage("Error in server side");
      print("Couldn't find the post 😱");
      return null;
    } on FormatException {
      print("Bad response format 👎");
      return null;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      if (e.toString().contains("Connection timed out")) {
        return null;
      }
    }
    EasyLoading.dismiss();
  }

  ///get function
  Future<Response?> getRequest({String? endPoint, var body}) async {
    try {
      Dio dio = Dio();

      dio.options.headers["Authorization"] = getTokenHeader();
      var response = await dio.get(
        baseUrl + endPoint!,
      );
      // print(response);
      if (response.statusCode == 200) {
        return response;
      } else {}
    } on SocketException {
      ShowMessage().showErrorMessage("No Internet Connection");
      print('No Internet connection 😑');
      return null;
    } on HttpException {
      //ShowMessage().showErrorMessage("$error");
      print("Couldn't find the post 😱");
      return null;
    } on FormatException {
      // ShowMessage().showErrorMessage("$error");
      // constValues().toast("$error", );
      // EasyLoading.dismiss();
      print("Bad response format 👎");
      return null;
    } catch (e) {
      print(e);
      if (e.toString().contains("Connection timed out")) {
        return null;
      }
    }
  }

  Future<Response> signUp({
    required String name,
    required String mobile,
    required String password,
    required String email,
    required String companyName,
    required String companyContact,
    required String address,
    required String rucOfCompany,
    required File image,
  }) async {
    Dio dioApi = Dio();
    String fileName = image.path.split('/').last;

    dioApi.options.headers['content-type'] = 'multipart/form-data';

    FormData formData = FormData.fromMap({
      "government_id": "12",
      "name": name,
      "user_type": 2,
      "mobile": mobile,
      "password": password,
      "password_confirm": password,
      "email": email,
      "latitude": "0.60000",
      "longitude": "0.50000",
      "company_name": companyName,
      "company_mobile": companyContact,
      "company_address": address,
      "ruc": rucOfCompany,
      "company_image": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      )
    });

    var response = await dioApi.post('$baseUrl/usersCreate', data: formData);

    if (response.data['status'] == 200) {
      return response;
    } else {
      ShowMessage().showErrorMessage(response.data['message']);
    }
    return response;
  }

  String getTokenHeader() {
    AuthController user = cont.Get.put(AuthController());
    String token = "Bearer ${user.userProfile.value.data?.user?.accessToken ?? "--"}";
    dev.log(token);
    return token;
  }
}