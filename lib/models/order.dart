class Order {
  late int id;
  late String total;
  late String date;
  late String paymentType;
  late String status;
  late String storeId;
  late String userId;
  late String addressId;
  String? paymentCardId;
  late String productsCount;
  // late List<Product> products;
  // late Address address;

  Order();

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    productsCount = json['products_count'];
    // if (json['products'] != null) {
    //   products = <Product>[];
    //   json['products'].forEach((v) {
    //     products!.add(new Product.fromJson(v));
    //   });
    // }
    // address = json['address'] != null ? new Address.fromJson(json['address']) : null;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['total'] = this.total;
  //   data['date'] = this.date;
  //   data['payment_type'] = this.paymentType;
  //   data['status'] = this.status;
  //   data['store_id'] = this.storeId;
  //   data['user_id'] = this.userId;
  //   data['address_id'] = this.addressId;
  //   data['payment_card_id'] = this.paymentCardId;
  //   data['order_products_count'] = this.orderProductsCount;
  //   return data;
  // }
}
