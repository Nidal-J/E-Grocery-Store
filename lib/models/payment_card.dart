class PaymentCard {
  late int id;
  late String type;
  late String holderName;
  late String cardNumber;
  late String expDate;
  late String cvv;
  late String createdAt;
  late String updatedAt;
  late String userId;

  PaymentCard();

  PaymentCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
