part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}


class GetFavoriteLoadingState extends FavoriteState {}
class GetFavoriteSuccessState extends FavoriteState
{
  final  List<Favorite>  favorite;

  GetFavoriteSuccessState(this.favorite);
}
class GetFavoriteErrorState extends FavoriteState
{
  final String error;

  GetFavoriteErrorState(this.error);
}

class RemoveFavoriteLoadingState extends FavoriteState {}

class RemoveFavoriteSuccessState extends FavoriteState
{

}

class RemoveFavoriteErrorState extends FavoriteState
{
  final String error;

  RemoveFavoriteErrorState(this.error);
}
