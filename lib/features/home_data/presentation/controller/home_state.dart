part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class BannerLoadingState extends HomeState {}

class BannerSuccessState extends HomeState {
  List<BannerData> bannerData;

  BannerSuccessState(this.bannerData);
}

class BannerErrorState extends HomeState {
  final String error;

  BannerErrorState(this.error);
}

class CategoriesLoadingState extends HomeState {}

class CategoriesSuccessState extends HomeState {
  List<Categories> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesErrorState extends HomeState {
  final String error;

  CategoriesErrorState(this.error);
}

class ProductLoadingState extends HomeState {}

class ProductSuccessState extends HomeState {
  List<Product> product;

  ProductSuccessState(this.product);
}

class ProductErrorState extends HomeState {
  final String error;

  ProductErrorState(this.error);
}

class AddFavoriteLoadingState extends HomeState {}

class AddFavoriteSuccessState extends HomeState {
  AddFavorite addFavorite;

  AddFavoriteSuccessState(this.addFavorite);
}

class AddFavoriteErrorState extends HomeState {
  final String error;

  AddFavoriteErrorState(this.error);
}

class AddCartLoadingState extends HomeState {}

class AddCartSuccessState extends HomeState {
  AddToCart addCart;

  AddCartSuccessState(this.addCart);
}

class AddCartErrorState extends HomeState {
  final String error;

  AddCartErrorState(this.error);
}

class SearchLoadingState extends HomeState {}

class SearchSuccessState extends HomeState {
  final List<Search> search;

  SearchSuccessState(this.search);
}

class SearchErrorState extends HomeState {
  final String error;

  SearchErrorState(this.error);
}

class ProductDetailsLoadingState extends HomeState {}

class ProductDetailsSuccessState extends HomeState {
  final ProductDetails productDetails;

  ProductDetailsSuccessState(this.productDetails);
}

class ProductDetailsErrorState extends HomeState {
  final String error;

  ProductDetailsErrorState(this.error);
}

class CategoriesDetailsLoadingState extends HomeState {}

class CategoriesDetailsSuccessState extends HomeState {
  final List<Product> categoriesDetails;

  CategoriesDetailsSuccessState(this.categoriesDetails);
}

class CategoriesDetailsErrorState extends HomeState {
  final String error;

  CategoriesDetailsErrorState(this.error);
}

class ChangeCartIconColorSuccessState extends HomeState {}

class ChangeFavoriteIconColorSuccessState extends HomeState {}
