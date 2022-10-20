import 'dart:convert';
import 'dart:developer';
import 'package:e_grocery/api/api_helper.dart';
import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/address.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:http/http.dart' as http;

class AddressesApiController with ApiHelper {
  // List<Address> listOfAddresses = [];
  // int selectedIndex = -1;

  Future<List<Address>?> getAddresses() async {
    Uri uri = Uri.parse(ApiSettings.addresses);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonAddresses = jsonResponse['list'] as List;
      List<Address> listOfAddresses = [];

      for (int i = 0; i < jsonAddresses.length; i++) {
        listOfAddresses.add(Address.fromJson(jsonAddresses[i]));
      }
      return listOfAddresses;
    }
    return null;
  }

  Future<ApiResponse> createAddress({required Address address}) async {
    Uri uri = Uri.parse(ApiSettings.addresses);
    log(uri.toString());
    var response = await http.post(
      uri,
      headers: ApiSettings.header,
      body: {
        'name': address.name,
        'info': address.info,
        'contact_number': address.contactNumber,
        'city_id': address.cityId.toString(),
      },
    );

    log(uri.toString());
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      log(jsonResponse['message']);

      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'] ?? false,
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> updateAddress({required Address address}) async {
    Uri uri = Uri.parse('${ApiSettings.addresses}/${address.id}');
    log(uri.toString());
    var response = await http.put(
      uri,
      headers: ApiSettings.header,
      body: {
        'name': address.name,
        'info': address.info,
        'contact_number': address.contactNumber,
        'city_id': address.cityId.toString(),
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'] ?? false,
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> deleteAddress({required int addressId}) async {
    Uri uri = Uri.parse('${ApiSettings.addresses}/$addressId');
    var response = await http.delete(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: true,
      );
    }
    return failedResponse;
  }
}
