import 'package:dartz/dartz.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/cart/domain/baserepository/cart_base_repository.dart';

import '../entites/add_order.dart';

class AddOrderUseCase extends BaseUseCase<AddOrder , NoParameters>
{
  final CartBaseRepository cartBaseRepository;

  AddOrderUseCase(this.cartBaseRepository);
  @override
  Future<Either<Failure, AddOrder>> call(NoParameters parameters) async
  {
    return await cartBaseRepository.addOrder();
  }

}