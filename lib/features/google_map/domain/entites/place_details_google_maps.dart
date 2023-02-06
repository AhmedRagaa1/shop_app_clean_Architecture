import 'package:equatable/equatable.dart';

class PlaceDetailsGoogleMaps extends Equatable {
  final double lat;
  final double long;

  const PlaceDetailsGoogleMaps({required this.lat, required this.long});

  @override
  List<Object?> get props =>
      [
        lat,
        long,
      ];
}
