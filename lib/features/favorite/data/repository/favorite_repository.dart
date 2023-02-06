import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/favorite/data/datasource/favorite_data_source.dart';
import 'package:shop_app/features/favorite/domain/baserepository/favorite_base_repository.dart';
import 'package:shop_app/features/favorite/domain/entites/favorite.dart';
import 'package:shop_app/features/favorite/domain/entites/product_item_favorite.dart';
import '../../../../core/error/exception.dart';

class FavoriteRepository extends FavoriteBaseRepository
{
  final FavoriteBaseRemoteDataSource favoriteBaseRemoteDataSource;

  FavoriteRepository(this.favoriteBaseRemoteDataSource);

  @override
  Future<Either<Failure, List<Favorite>>> getFavorite() async
  {
    final result = await favoriteBaseRemoteDataSource.getFavoriteItem();

    try
    {
      print(result);
      return Right(result);
    }on ServerException catch(failure)
    {
    print('errrrrrrorrrrrrrrrrr');
    return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }


}