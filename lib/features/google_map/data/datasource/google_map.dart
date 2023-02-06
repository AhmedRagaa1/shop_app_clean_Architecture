import 'package:dio/dio.dart';
import 'package:shop_app/core/network/api_constant.dart';
import 'package:shop_app/features/google_map/data/model/place_details_model.dart';

import '../../domain/usescase/place_details_google_maps.dart';
import '../../domain/usescase/search_google_maps_use_case.dart';
import '../model/search_maps_model.dart';

abstract class GoogleMapBaseRemoteDataSource
{
  Future<List<SearchMapsModel>> searchInGoogleMaps(SearchMapsParameters parameters);
  Future<PlaceDetailsModel> getPlaceDetailsInGoogleMaps(PlaceDetailsParameters parameters);
}

class GoogleMapRemoteDataSource extends GoogleMapBaseRemoteDataSource
{
  @override
  Future<List<SearchMapsModel>> searchInGoogleMaps(SearchMapsParameters parameters)async
  {

    final response = await Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 20*1000,
        receiveTimeout: 20*1000,
      ),
    ).get(ApiConstant.searchInGoogleMaps , queryParameters:
    {
      'input': parameters.place,
      'types':'address',
      'components':'country:eg',
      'key': ApiConstant.apiKeyGoogleMaps,
      'sessiontoken':parameters.sessionToken,
    });

    print(response);

    if(response.statusCode == 200)
    {
      print("I am in google maps  data source success **************************************************************");
      return List<SearchMapsModel>.from((response.data["predictions"]as List).map((e) => SearchMapsModel.fromJson(e)));
    }else
    {
      print("I am in google maps data source error**************************************************************");
      return [];
    }


  }

  @override
  Future<PlaceDetailsModel> getPlaceDetailsInGoogleMaps(PlaceDetailsParameters parameters) async
  {

    final response = await Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 20*1000,
        receiveTimeout: 20*1000,
      ),
    ).get(ApiConstant.placeDetailsInGoogleMaps , queryParameters:
    {
      'place_id': parameters.placeId,
      'fields':'geometry',
      'key': ApiConstant.apiKeyGoogleMaps,
      'sessiontoken':parameters.sessionToken,
    });

    print(response);

    if(response.statusCode == 200)
    {
      print("I am in Place Details google maps  data source success **************************************************************");
      return PlaceDetailsModel.fromJson(response.data['result']['geometry']['location']);
    }else
    {
      print("I am in google maps data source error**************************************************************");
      throw Exception('place location error');
    }


  }

}