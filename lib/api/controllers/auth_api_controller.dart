import 'dart:convert';
import 'dart:developer';
import 'package:e_grocery/api/api_helper.dart';
import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/models/user.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelper {
  Future<ApiResponse> login({
    required String phone,
    required String password,
  }) async {
    Uri uri = Uri.parse(ApiSettings.login);
    // log(uri.toString());
    var response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
        'lang': userLocale,
      },
      body: {
        'mobile': phone,
        'password': password,
      },
    );
    // log('login: ${response.statusCode}');

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['data'] != null) {
        User user = User.fromJson(jsonResponse['data']);
        await SharedPrefController().save(user: user);
      }
      return ApiResponse(
        message: jsonResponse['message'],
        // message: jsonResponse['status']
        //     ? 'Logged in successfully'
        //     : 'Incorrect mobile or password',
        success: jsonResponse['status'],
        // status = true -----> 200
        // status = false ----> 400
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> register({required User user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(
      uri,
      // headers: {'Accept': 'application/json'},
      body: {
        'name': user.name,
        'mobile': user.mobile,
        'gender': user.gender,
        'city_id': user.cityId,
        'password': user.password,
        'STORE_API_KEY': '05de5859-7813-425c-977a-9729a8eba31e',
      },
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['status']
            ? 'Your verification code is ${jsonResponse['code']}'
            : 'This mobile number is used before.',
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> activate(
      {required String phoneNumber, required int code}) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(
      uri,
      body: {
        'mobile': phoneNumber,
        'code': code,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );

    if (response.statusCode == 200 || response.statusCode == 401) {
      // var jsonResponse = jsonDecode(response.body);
      var lang = userLocale;
      await SharedPrefController().clear();
      await SharedPrefController().saveLang(lang);
      return const ApiResponse(
        message: 'Logout Successfully',
        success: true,
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> forgetPassword({required String phoneNumber}) async {
    Uri uri = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
      body: {'mobile': phoneNumber},
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      log(jsonResponse['code'].toString());
      return ApiResponse(
        message: jsonResponse['status'] == true
            ? jsonResponse['code'].toString()
            : jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> resetPassword({
    required String phoneNumber,
    required String code,
    required String password,
  }) async {
    Uri uri = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(
      uri,
      body: {
        'mobile': phoneNumber,
        'code': code,
        'password': password,
        'password_confirmation': password,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    Uri uri = Uri.parse(ApiSettings.changePassword);
    log('message 0');
    var response = await http.post(
      uri,
      headers: ApiSettings.header,
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      },
    );
    log('message 1');
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> updateProfile({
    required String name,
    required String gender,
    required String cityId,
  }) async {
    Uri uri = Uri.parse(ApiSettings.updateProfile);
    var response = await http.post(
      uri,
      headers: ApiSettings.header,
      body: {
        'name': name,
        'gender': gender,
        'city_id': cityId,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        await SharedPrefController().updateProfile(
          name: name,
          gender: gender,
          cityId: cityId,
        );
      }
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }
}
