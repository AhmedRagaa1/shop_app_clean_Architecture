import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/data/datasource/home_remote_data_source.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';
import 'package:shop_app/features/home_data/domain/entites/add_cart.dart';
import 'package:shop_app/features/home_data/domain/entites/add_favorite.dart';
import 'package:shop_app/features/home_data/domain/entites/banner.dart';
import 'package:shop_app/features/home_data/domain/entites/categories.dart';
import 'package:shop_app/features/home_data/domain/entites/product.dart';
import 'package:shop_app/features/home_data/domain/entites/product_details.dart';
import 'package:shop_app/features/home_data/domain/entites/search.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_cart_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_favorite_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/banner_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/categories_details_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/categories_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/product_detail_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/product_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/search_use_case.dart';

import '../../../../core/error/exception.dart';

class HomeRepository extends HomeBaseRepository
{
  final BaseHomeRemoteDataSource homeRemoteDataSource;

  HomeRepository(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<Categories>>> categoriesType() async
  {

    try
    {
      final result = await homeRemoteDataSource.getCategoriesData();
      print('******* result categories');
      print(result);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }

  @override
  Future<Either<Failure, List<BannerData>>> homeBanner() async
  {
    try
    {
      final result = await  homeRemoteDataSource.getBannerData();
      print(result);
      print('******* result Banner');
      print(result[0].id);
      return Right(result);
    }on ServerException catch (failure)
    {
      print('errrrrrrrrrrrrrrrrr');
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> homeProduct() async
  {

    try
    {
      final result = await homeRemoteDataSource.getProductData();
      print('******* result Product');
      print(result);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddFavorite>> addOrRemoveFavorite(AddOrRemoveFavoriteParameters parameters) async
  {

    try
    {
      final result = await homeRemoteDataSource.addFavoriteItem(parameters);
      print(result);
      print(result.id);
      print('******* result add Favorite ///////8555554545////8/855/');
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddToCart>> addOrRemoveCart(AddOrRemoveCartParameters parameters) async
  {

    try
    {
      final result = await homeRemoteDataSource.addCartItem(parameters);
      print(result.id);
      print('******* result add Cart ///////8555554545////8/855/');
      print(result);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Search>>> searchAboutProduct(SearchParameters parameters)async
  {

    try
    {
      final result = await homeRemoteDataSource.searchAboutItem(parameters);
      print(result[0].id);
      print('******* result add Cart ///////8555554545////8/855/');
      print(result);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails(ProductDetailsParameters parameters) async
  {

    try
    {
      final result = await homeRemoteDataSource.getProductDetails(parameters);
      print(result.description);
      print('******* result ProductDetails ///////8555554545////8/855/');
      print(result);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategoriesDetails(CategoriesDetailsParameters parameters)async
  {

    try
    {
      final result = await homeRemoteDataSource.getCategoriesDetails(parameters);
      print(result[0].name);
      print('******* result ProductDetails ///////8555554545////8/855/');
      print(result);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}