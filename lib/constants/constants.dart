import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color black = Color(0xFF16162E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF40AA54);
  static const Color lightGreen = Color(0xFFE8F7EB);
  static const Color grey = Color(0xFF8B8B97);
  static const Color lightGrey = Color(0xFFF7F7F7);
  static const Color scaffoldBg = Color(0xFFF2F2F2);

  static const Color danger = Color(0xFFFF2222);
  static const Color warning = Color(0xFFFFC107);
  static const Color shadow = Color(0x286C7E93);
  static Color shimmerBaseColor = Colors.grey.shade300;
  static Color shimmerHighlightColor = Colors.grey.shade100;
  static const Color orderStatusBg = Color(0xFFECECEC);
  static const Color orderConfrirmed = Color(0xFF4044AA);
  static const Color orderShipped = Color(0xFFE09605);
  static const Color orderProcessing = Color(0xFF30DFB8);

  // static const Color balck = Color(0xFF16162E);
}

class AppImages {
  static const String path = 'assets/images';
  static const String paymentCardPath = 'assets/images/payment_cards';
  static const String socialMediaPath = 'assets/images/social_media';
  static const String catPath = '$path/categories';
  static const String productPath = '$path/products';
  static const String iconPath = '$path/icons';

  // static const String logo = '$path/logo.svg';
  static const String logo = '$iconPath/logo.png';
  static const String welcomeBg = '$path/welcome_bg.png';
}

class AppFonts {
  static TextStyle label = TextStyle(
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

String get deviceLocale {
  // return Locale(Get.locale.toString().split('_').first);
  return Get.deviceLocale?.toLanguageTag().split('-').first ?? 'en';
}

String get userLocale {
  print(SharedPrefController().getByKey<String>(key: PrefKeys.lang.name));
  print(deviceLocale);
  return SharedPrefController().getByKey<String>(key: PrefKeys.lang.name) ??
      deviceLocale;
}
