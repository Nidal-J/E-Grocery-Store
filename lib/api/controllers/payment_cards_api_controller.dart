import 'dart:convert';
import 'dart:developer';
import 'package:e_grocery/api/api_helper.dart';
import 'package:e_grocery/api/api_settings.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/models/payment_card.dart';
import 'package:http/http.dart' as http;

class PaymentCardsApiController with ApiHelper {
  Future<List<PaymentCard>?> getPaymentCards() async {
    Uri uri = Uri.parse(ApiSettings.paymentCards);
    var response = await http.get(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonPayments = jsonResponse['list'] as List;
      List<PaymentCard> listOfPaymentCards = [];

      for (var paymentCard in jsonPayments) {
        listOfPaymentCards.add(PaymentCard.fromJson(paymentCard));
      }
      return listOfPaymentCards;
    }
    return null;
  }

  Future<ApiResponse> createPaymentCard(
      {required PaymentCard paymentCard}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards);
    log(uri.toString());
    var response = await http.post(
      uri,
      headers: ApiSettings.header,
      body: {
        'holder_name': paymentCard.holderName,
        'card_number': paymentCard.cardNumber,
        'exp_date': paymentCard.expDate,
        'cvv': paymentCard.cvv,
        'type': paymentCard.type,
      },
    );

    log(uri.toString());
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      log(jsonResponse['message']);

      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'] ?? false,
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> updatePaymentCard(
      {required PaymentCard paymentCard}) async {
    Uri uri = Uri.parse('${ApiSettings.paymentCards}/${paymentCard.id}');
    log(uri.toString());
    var response = await http.put(
      uri,
      headers: ApiSettings.header,
      body: {
        'holder_name': paymentCard.holderName,
        'card_number': paymentCard.cardNumber,
        'exp_date': paymentCard.expDate,
        'cvv': paymentCard.cvv,
        'type': paymentCard.type,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);

      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'] ?? false,
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> deletePaymentCard({required int paymentCardId}) async {
    Uri uri = Uri.parse('${ApiSettings.addresses}/$paymentCardId');
    var response = await http.delete(
      uri,
      headers: ApiSettings.header,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: true,
      );
    }
    return failedResponse;
  }
}
