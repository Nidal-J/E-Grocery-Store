import 'dart:convert';
import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/city.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CityApiController {
  Future<List<City>?> getCities() async {
    Uri uri = Uri.parse(ApiSettings.city);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonCities = jsonResponse['list'] as List;
      List<City> listOfCities = [];
      for (int i = 0; i < jsonCities.length; i++) {
        listOfCities.add(City.fromJson(jsonCities[i]));
      }
      return listOfCities;
    }
    return null;
  }

  Future<List<DropdownMenuItem<int>>?> getDropDownCitiesList() async {
    List<DropdownMenuItem<int>>? list = [];
    List<City>? cities = await getCities();
    if (cities != null) {
      for (var city in cities) {
        list.add(DropdownMenuItem<int>(
          value: city.id,
          child: Text(city.name),
        ));
      }
      return list;
    }
    return null;
  }
}
