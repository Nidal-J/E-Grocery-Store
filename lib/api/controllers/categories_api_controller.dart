import 'dart:convert';
import 'dart:developer';
import 'package:e_grocery/api/api_helper.dart';
import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/all_categories.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/models/sub_category.dart';
import 'package:http/http.dart' as http;

class CategoriesApiController with ApiHelper {
  Future<List<AllCategories>?> getCategories() async {
    Uri uri = Uri.parse(ApiSettings.categories);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonData = jsonResponse['list'];
      List<AllCategories> allCategories = [];

      for (var category in jsonData) {
        allCategories.add(AllCategories.fromJson(category));
      }
      return allCategories;
    }
    return null;
  }

  Future<List<SubCategory>?> getSubCategories(int id) async {
    Uri uri = Uri.parse('${ApiSettings.categories}/$id');
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonData = jsonResponse['list'];
      List<SubCategory> subCategories = [];

      for (var subCategory in jsonData) {
        subCategories.add(SubCategory.fromJson(subCategory));
      }
      return subCategories;
    }
    return null;
  }

  Future<List<Product>?> getProducts(int id) async {
    Uri uri = Uri.parse('${ApiSettings.subCategories}/$id');

    var response = await http.get(uri, headers: ApiSettings.header);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonData = jsonResponse['list'] as List;

      List<Product> products = [];

      for (var product in jsonData) {
        products.add(Product.fromJson(product));
      }
      return products;
    }
    return null;
  }

  Future<Product?> getProductDetails(int id) async {
    Uri uri = Uri.parse('${ApiSettings.products}/$id');

    var response = await http.get(uri, headers: ApiSettings.header);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonData = jsonResponse['object'];
      log(jsonData.toString());
      Product product = Product.fromJson(jsonData);
      return product;
    }
    return null;
  }

  Future<ApiResponse> rateProducts({
    required int productId,
    required double rate,
  }) async {
    Uri uri = Uri.parse(ApiSettings.rateProducts);
    log('111');
    var response = await http.post(uri, headers: ApiSettings.header, body: {
      'product_id': productId.toString(),
      'rate': rate.toString(),
    });
    log('222');

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return ApiResponse(message: jsonResponse['message'], success: true);
    }
    return failedResponse;
  }
}
