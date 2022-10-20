import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/category.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/models/banner_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeApiController {
  Future<Map<String, dynamic>?> getHome() async {
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonData = jsonResponse['data'] as Map<String, dynamic>;
      return jsonData;
    }
    return null;
  }

  Future<List<BannerSlider>?> getSlider() async {
    List? jsonSlider = (await getHome())?['slider'] as List?;
    List<BannerSlider> slider = [];
    if (jsonSlider != null) {
      for (int i = 0; i < jsonSlider.length; i++) {
        slider.add(BannerSlider.fromJson(jsonSlider[i]));
      }
      return slider;
    }
    return null;
  }

  Future<List<Category>?> getCategories() async {
    List? jsonCategories = (await getHome())?['categories'] as List?;
    List<Category> categories = [];
    if (jsonCategories != null) {
      for (int i = 0; i < jsonCategories.length; i++) {
        categories.add(Category.fromJson(jsonCategories[i]));
      }
      return categories;
    }
    return null;
  }

  Future<List<Product>?> getLatestProducts() async {
    List? jsonLatestProducts = (await getHome())?['latest_products'] as List?;
    List<Product> latestProducts = [];
    if (jsonLatestProducts != null) {
      for (int i = 0; i < jsonLatestProducts.length; i++) {
        latestProducts.add(Product.fromJson(jsonLatestProducts[i]));
      }
      return latestProducts;
    }
    return null;
  }

  Future<List<Product>?> getFamousProducts() async {
    List? jsonLatestProducts = (await getHome())?['famous_products'] as List?;
    List<Product> famousProducts = [];
    if (jsonLatestProducts != null) {
      for (int i = 0; i < jsonLatestProducts.length; i++) {
        famousProducts.add(Product.fromJson(jsonLatestProducts[i]));
      }
      return famousProducts;
    }
    return null;
  }
}
