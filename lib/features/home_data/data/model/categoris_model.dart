import 'package:shop_app/features/home_data/domain/entites/categories.dart';

class CategoriesModel extends Categories {
  CategoriesModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}
