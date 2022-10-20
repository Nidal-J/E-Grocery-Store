import 'dart:ui';

import 'package:get/get.dart';

class City {
  late int id;
  late String nameEn;
  late String nameAr;
  late String name;

  City();

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    name = Get.locale == const Locale('ar') ? nameAr : nameEn;
  }
}
