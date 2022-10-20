class CartProduct {
  late int id;
  late String name;
  late String imageUrl;
  late int quantity;
  late double price;
  // late double totalPrice;
  late int productId;

  static const tableName = 'cart';

  CartProduct();

  CartProduct.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    imageUrl = map['image_url'];
    quantity = map['quantity'];
    price = map['price'];
    // totalPrice = map['total_price'];
    productId = map['product_id'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['quantity'] = quantity;
    data['price'] = price;
    // data['total_price'] = totalPrice;
    // data['total_price'] = price * quantity;
    data['product_id'] = productId;
    return data;
  }
}
