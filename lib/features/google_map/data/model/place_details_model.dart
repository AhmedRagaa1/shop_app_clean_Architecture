import 'package:shop_app/features/google_map/domain/entites/place_details_google_maps.dart';

class PlaceDetailsModel extends PlaceDetailsGoogleMaps {
  const PlaceDetailsModel({required super.lat, required super.long});

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      PlaceDetailsModel(
        lat: json['lat'],
        long: json['lng'],
      );
}
