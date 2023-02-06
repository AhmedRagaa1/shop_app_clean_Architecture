import 'package:equatable/equatable.dart';

class SearchMaps extends Equatable
{
  final String description;
  final String placeId;

  SearchMaps({required this.description, required this.placeId});

  @override
  List<Object?> get props =>
      [
        description,
        placeId,
      ];
}