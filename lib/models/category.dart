import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Category {
  late int id;
  late String nameEn;
  late String nameAr;
  late String name;
  late String image;
  late String imageUrl;

  Category();

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    name = Get.locale == const Locale('ar') ? nameAr : nameEn;

    image = json['image'];
    imageUrl = json['image_url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name_en'] = this.nameEn;
  //   data['name_ar'] = this.nameAr;
  //   data['image'] = this.image;
  //   data['image_url'] = this.imageUrl;
  //   return data;
  // }
}
