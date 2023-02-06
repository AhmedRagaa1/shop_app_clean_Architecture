import 'package:shop_app/features/google_map/data/datasource/google_map.dart';
import 'package:shop_app/features/google_map/domain/baserepository/google_maps.dart';
import 'package:shop_app/features/google_map/domain/entites/place_details_google_maps.dart';
import 'package:shop_app/features/google_map/domain/entites/search_maps.dart';
import 'package:shop_app/features/google_map/domain/usescase/place_details_google_maps.dart';
import 'package:shop_app/features/google_map/domain/usescase/search_google_maps_use_case.dart';

class GoogleMapsRepository extends GoogleMapsBaseRepository
{
  final GoogleMapBaseRemoteDataSource googleMapBaseRemoteDataSource;

  GoogleMapsRepository(this.googleMapBaseRemoteDataSource);
  @override
  Future<List<SearchMaps>> searchInGoogleMaps(SearchMapsParameters parameters) async
  {

      print('******* result Search in google maps ****************');
      final result = await googleMapBaseRemoteDataSource.searchInGoogleMaps(parameters);
      return result;

  }

  @override
  Future<PlaceDetailsGoogleMaps> getPlaceDetailsInGoogleMaps(PlaceDetailsParameters parameters) async
  {
    print('******* result place details in google maps ****************');
    final result = await googleMapBaseRemoteDataSource.getPlaceDetailsInGoogleMaps(parameters);
    return result;
  }

}