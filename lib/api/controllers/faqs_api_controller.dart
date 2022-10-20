import 'dart:convert';

import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/faqs_model.dart';
import 'package:http/http.dart' as http;

class FaqsApiController {
  Future<List<FaqsModel>?> getFaqs() async {
    Uri uri = Uri.parse(ApiSettings.faqs);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['list'];
      List<FaqsModel> faqsList = [];
      for (var faq in jsonData) {
        faqsList.add(FaqsModel.fromJson(faq));
      }
      return faqsList;
    }
    return null;
  }
}
