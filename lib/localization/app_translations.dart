import 'package:e_grocery/localization/ar.dart';
import 'package:e_grocery/localization/en.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enLocale,
        'ar': arLocale,
      };
}
