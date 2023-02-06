import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/features/google_map/domain/baserepository/google_maps.dart';
import 'package:shop_app/features/google_map/domain/entites/place_details_google_maps.dart';
import 'package:shop_app/features/home_data/domain/usescase/product_detail_use_case.dart';

class PlaceDetailsUseCase extends BaseUseCaseNotEither<PlaceDetailsGoogleMaps , PlaceDetailsParameters>
{
  final GoogleMapsBaseRepository googleMapsBaseRepository;

  PlaceDetailsUseCase(this.googleMapsBaseRepository);

  @override
  Future<PlaceDetailsGoogleMaps> call(PlaceDetailsParameters parameters) async
  {
    return await googleMapsBaseRepository.getPlaceDetailsInGoogleMaps(parameters);
  }

}


class PlaceDetailsParameters extends Equatable
{
  final String placeId;
  final String sessionToken;

  const PlaceDetailsParameters({required this.placeId, required this.sessionToken});

  @override
  List<Object?> get props =>
      [
        placeId,
        sessionToken,
      ];


}