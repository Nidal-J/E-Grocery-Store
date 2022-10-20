import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String name;
  late String infoEn;
  late String infoAr;
  late String info;
  late String price;
  late String quantity;
  late String overalRate;
  late String subCategoryId;
  // late double productRate;
  late dynamic productRate;
  String? offerPrice;
  late bool isFavorite;
  late String imageUrl;
  List<Images> images = [];

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    name = Get.locale == const Locale('ar') ? nameAr : nameEn;

    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    info = (Get.locale == const Locale('ar')) ? infoAr : infoEn;
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    // productRate = double.tryParse(json['product_rate']?.toString() ?? '0') ?? 0;
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      for (var img in (json['images'] as List)) {
        images.add(Images.fromJson(img));
      }
    }
  }
}

class Images {
  late int id;
  late String objectId;
  late String url;
  late String imageUrl;

  Images();

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }
}
