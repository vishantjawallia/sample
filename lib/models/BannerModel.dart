class BannerModel {
  String? id;
  String? image;
  String? url;
  bool? status;

  BannerModel({
    this.id,
    this.image,
    this.url,
    this.status,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      url: json['url'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['url'] = url;
    data['status'] = status;
    return data;
  }
}
