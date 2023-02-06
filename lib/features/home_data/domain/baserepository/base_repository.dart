import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/entites/add_cart.dart';
import 'package:shop_app/features/home_data/domain/entites/add_favorite.dart';
import 'package:shop_app/features/home_data/domain/entites/banner.dart';
import 'package:shop_app/features/home_data/domain/entites/categories.dart';
import 'package:shop_app/features/home_data/domain/entites/product.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_favorite_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/search_use_case.dart';

import '../entites/product_details.dart';
import '../entites/search.dart';
import '../usescase/add_or_remove_cart_use_case.dart';
import '../usescase/categories_details_use_case.dart';
import '../usescase/product_detail_use_case.dart';


abstract class HomeBaseRepository
{
  Future<Either<Failure , List<Product>>> homeProduct();
  Future<Either<Failure , List<BannerData>>> homeBanner();
  Future<Either<Failure , List<Categories>>> categoriesType();
  Future<Either<Failure,AddFavorite>> addOrRemoveFavorite(AddOrRemoveFavoriteParameters parameters);
  Future<Either<Failure,AddToCart>> addOrRemoveCart(AddOrRemoveCartParameters parameters);
  Future<Either<Failure,List<Search>>> searchAboutProduct(SearchParameters parameters);
  Future<Either<Failure,ProductDetails>> getProductDetails(ProductDetailsParameters parameters);
  Future<Either<Failure,List<Product>>> getCategoriesDetails(CategoriesDetailsParameters parameters);

}