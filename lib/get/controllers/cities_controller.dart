import 'package:e_grocery/api/controllers/city_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitiesController extends GetxController {
  @override
  void onInit() async {
    print('onInit cities ************');
    listOfCities = await CityApiController().getDropDownCitiesList();
    print('onInit cities ************');
    super.onInit();
  }

  List<DropdownMenuItem<int>>? listOfCities;
}
