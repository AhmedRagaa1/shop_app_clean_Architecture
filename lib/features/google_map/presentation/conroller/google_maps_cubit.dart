import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/google_map/domain/entites/place_details_google_maps.dart';
import 'package:shop_app/features/google_map/domain/entites/search_maps.dart';
import 'package:shop_app/features/google_map/domain/usescase/place_details_google_maps.dart';

import '../../domain/usescase/search_google_maps_use_case.dart';

part 'google_maps_state.dart';

class GoogleMapsCubit extends Cubit<GoogleMapsState>
{
  GoogleMapsCubit(this.searchMapsUseCase, this.placeDetailsUseCase) : super(GoogleMapsInitial());

  static GoogleMapsCubit get(context) => BlocProvider.of(context);


  SearchMapsUseCase searchMapsUseCase;
  FutureOr<void> searchInGoogleMaps({
  required String place,
  required String sessionToken,
}) async
  {
    emit(SearchGoogleMapsLoadingState());
    final result = await searchMapsUseCase(SearchMapsParameters(place: place, sessionToken: sessionToken)).then((value)
    {
      print(value);
      print("SearchGoogleMaps cubit Success *************   ***********");
        emit(SearchGoogleMapsSuccessState(value));
    }).catchError((error)
    {
      print("SearchGoogleMaps cubit Error * ************   ***********");
      emit(SearchGoogleMapsErrorState(error.toString()));
    });

  }


  PlaceDetailsUseCase placeDetailsUseCase;
  FutureOr<void> getPlaceDetails(
  {
  required String placeId,
  required String sessionToken,
})async
  {
    emit(PlaceDetailsGoogleMapsLoadingState());
    final result = await placeDetailsUseCase(PlaceDetailsParameters(placeId: placeId, sessionToken: sessionToken)).then((value)
    {
      print(value);
      print("PlaceDetailsGoogleMaps cubit Success *************   ***********");
      emit(PlaceDetailsGoogleMapsSuccessState(value));
    }).catchError((error)
    {
      print("PlaceDetailsGoogleMaps cubit Error * ************   ***********");
      emit(PlaceDetailsGoogleMapsErrorState(error));
    });;
  }

}
