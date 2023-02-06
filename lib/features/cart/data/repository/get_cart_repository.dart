import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/cart/domain/entites/add_order.dart';
import 'package:shop_app/features/Setting/domain/entites/ger_order.dart';
import 'package:shop_app/features/cart/domain/entites/update_cart.dart';
import 'package:shop_app/features/cart/domain/usescase/update_cart.dart';
import '../../../../core/error/exception.dart';
import '../../domain/baserepository/cart_base_repository.dart';
import '../../domain/entites/cart.dart';
import '../datasource/cart_data_source.dart';

class CartRepository extends CartBaseRepository
{
  final CartBaseRemoteDataSource cartBaseRemoteDataSource;

  CartRepository(this.cartBaseRemoteDataSource);

  @override
  Future<Either<Failure, Cart>> getCart() async
  {

    try
    {
      final result = await cartBaseRemoteDataSource.getCartItem();
      print(result);
      print(result.subTotal);
      // print(result.cartItems[0].productItem!.image);
      return Right(result);
    }on ServerException catch(failure)
    {
      print('errrrrrrorrrrrrrrrrr');
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }

  @override
  Future<Either<Failure, AddOrder>> addOrder() async
  {

    try
    {
      final result = await cartBaseRemoteDataSource.addOrder();
      print(result);
      print(result.total);
      return Right(result);
    }on ServerException catch(failure)
    {
      print('errrrrrrorrrrrrrrrrr');
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateCart>> updateCart(UpdateCartParameters parameters)async
  {
    try
    {
      final result = await cartBaseRemoteDataSource.updateCart(parameters);
      print(result);
      print(result.quantity);
      return Right(result);
    }on ServerException catch(failure)
    {
      print('errrrrrrorrrrrrrrrrr');
      return Left(ServerFailure(failure.errorMessageModel.message));

    }
  }



}