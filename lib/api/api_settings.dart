import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';

class ApiSettings {
  static const _baseUrl = 'https://smart-store.mr-dev.tech/api/';
  static const login = '${_baseUrl}auth/login';
  static const register = '${_baseUrl}auth/register';
  static const activate = '${_baseUrl}auth/activate';
  static const forgetPassword = '${_baseUrl}auth/forget-password';
  static const resetPassword = '${_baseUrl}auth/reset-password';
  static const changePassword = '${_baseUrl}auth/change-password';
  static const updateProfile = '${_baseUrl}auth/update-profile';
  static const logout = '${_baseUrl}auth/logout';
  static const city = '${_baseUrl}cities';
  static const home = '${_baseUrl}home';
  static const categories = '${_baseUrl}categories';
  static const subCategories = '${_baseUrl}sub-categories';
  static const products = '${_baseUrl}products';
  static const favoriteProducts = '${_baseUrl}favorite-products';
  static const rateProducts = '${_baseUrl}products/rate';
  static const addresses = '${_baseUrl}addresses';
  static const paymentCards = '${_baseUrl}payment-cards';
  static const faqs = '${_baseUrl}faqs';

  static final header = {
    'Accept': 'application/json',
    'Authorization': SharedPrefController().token,
    'lang': userLocale,
  };
  // static final token = SharedPrefController().token;
}
