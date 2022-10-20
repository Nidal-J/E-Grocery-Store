import 'dart:ui';
import 'package:get/utils.dart';

class SubCategory {
  late int id;
  late String nameEn;
  late String nameAr;
  late String name;
  late String categoryId;
  late String image;
  late String productsCount;
  late String imageUrl;

  SubCategory();

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    name = Get.locale == const Locale('ar') ? nameAr : nameEn;

    categoryId = json['category_id'];
    image = json['image'];
    productsCount = json['products_count'];
    imageUrl = json['image_url'];
  }
}
