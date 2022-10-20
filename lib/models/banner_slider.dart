class BannerSlider {
  late int id;
  late String objectId;
  late String url;
  late String imageUrl;

  BannerSlider();

  BannerSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['object_id'] = objectId;
  //   data['url'] = url;
  //   data['image_url'] = imageUrl;
  //   return data;
  // }
}
