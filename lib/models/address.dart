import 'package:e_grocery/models/city.dart';

class Address {
  late int id;
  late String name;
  late String info;
  late String contactNumber;
  late int cityId;
  String? lat;
  String? lang;
  City? city;

  Address();

  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    cityId = json['city_id'];
    lat = json['lat'];
    lang = json['lang'];
    id = json['id'];
    if (json['city'] != null) {
      city = City.fromJson(json['city']);
    }
  }
}
