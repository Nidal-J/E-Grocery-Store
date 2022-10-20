import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class AllCategories {
  late int id;
  late String nameEn;
  late String nameAr;
  late String name;

  late String image;
  late String imageUrl;
  late String productsCount;
  late String subCategoriesCount;

  AllCategories();

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    name = Get.locale == const Locale('ar') ? nameAr : nameEn;
    image = json['image'];
    imageUrl = json['image_url'];
    productsCount = json['products_count'];
    subCategoriesCount = json['sub_categories_count'];
  }
}
