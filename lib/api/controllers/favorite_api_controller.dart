import 'dart:convert';
import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/product.dart';
import 'package:http/http.dart' as http;

class FavoriteApiController {
  Uri uri = Uri.parse(ApiSettings.favoriteProducts);
  List<Product> listOfFavorites = [];

  Future<List<Product>?> getFavoriteProducts() async {
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonData = jsonResponse['list'] as List;
      for (var favorite in jsonData) {
        listOfFavorites.add(Product.fromJson(favorite));
      }
      return listOfFavorites;
    }
    return null;
  }

  Future<bool> postFavoriteProduct(int id) async {
    var response = await http.post(
      uri,
      headers: ApiSettings.header,
      body: {'product_id': id.toString()},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
