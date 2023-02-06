import 'package:shop_app/features/google_map/domain/entites/search_maps.dart';

class SearchMapsModel extends SearchMaps {
  SearchMapsModel({required super.description, required super.placeId});

  factory SearchMapsModel.fromJson(Map<String, dynamic> json) =>
      SearchMapsModel(
        description: json['description'],
        placeId: json['place_id'],
      );
}
