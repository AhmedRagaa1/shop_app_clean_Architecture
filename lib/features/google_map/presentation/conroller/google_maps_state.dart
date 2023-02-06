part of 'google_maps_cubit.dart';

@immutable
abstract class GoogleMapsState {}

class GoogleMapsInitial extends GoogleMapsState {

}


class SearchGoogleMapsLoadingState extends GoogleMapsState {}

class SearchGoogleMapsSuccessState extends GoogleMapsState
{
  final List<SearchMaps> searchMaps;

  SearchGoogleMapsSuccessState(this.searchMaps);
}

class SearchGoogleMapsErrorState extends GoogleMapsState {
  final String error;

  SearchGoogleMapsErrorState(this.error);
}

class PlaceDetailsGoogleMapsLoadingState extends GoogleMapsState {}

class PlaceDetailsGoogleMapsSuccessState extends GoogleMapsState
{
  final PlaceDetailsGoogleMaps placeDetailsGoogleMaps;

  PlaceDetailsGoogleMapsSuccessState(this.placeDetailsGoogleMaps);
}

class PlaceDetailsGoogleMapsErrorState extends GoogleMapsState {
  final String error;

  PlaceDetailsGoogleMapsErrorState(this.error);
}
