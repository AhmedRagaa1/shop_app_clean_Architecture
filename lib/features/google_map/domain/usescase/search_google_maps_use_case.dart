import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/google_map/domain/entites/search_maps.dart';

import '../baserepository/google_maps.dart';

class SearchMapsUseCase extends BaseUseCaseNotEither<List<SearchMaps> , SearchMapsParameters>
{
  final GoogleMapsBaseRepository googleMapsBaseRepository;

  SearchMapsUseCase(this.googleMapsBaseRepository);

  @override
  Future<List<SearchMaps>> call(SearchMapsParameters parameters) async
  {
    return  await googleMapsBaseRepository.searchInGoogleMaps(parameters);
  }
}


class SearchMapsParameters extends Equatable
{
  final String place;
  final String sessionToken;

  const SearchMapsParameters({required this.place , required this.sessionToken});

  @override
  List<Object?> get props =>
      [
        place,
        sessionToken,
      ];
}