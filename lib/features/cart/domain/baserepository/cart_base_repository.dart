import 'package:dartz/dartz.dart';
import 'package:shop_app/features/Setting/domain/entites/ger_order.dart';

import '../../../../core/error/failure.dart';
import '../entites/add_order.dart';
import '../entites/cart.dart';
import '../entites/update_cart.dart';
import '../usescase/update_cart.dart';

abstract class CartBaseRepository
{
  Future<Either<Failure,Cart>> getCart();
  Future<Either<Failure , AddOrder>> addOrder();
  Future<Either<Failure , UpdateCart>> updateCart(UpdateCartParameters parameters);
}