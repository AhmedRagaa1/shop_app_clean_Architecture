import 'package:shop_app/features/home_data/domain/entites/banner.dart';

class BannerModel extends BannerData {
  BannerModel({
    required super.id,
    required super.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'],
        image: json['image'],
      );
}
