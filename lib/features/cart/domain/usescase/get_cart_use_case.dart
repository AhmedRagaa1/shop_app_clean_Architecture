import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/cart/domain/baserepository/cart_base_repository.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../entites/cart.dart';

class GetCartUseCase extends BaseUseCase<Cart , NoParameters>
{
  final CartBaseRepository cartBaseRepository;

  GetCartUseCase(this.cartBaseRepository);

  @override
  Future<Either<Failure, Cart>> call(NoParameters parameters) async
  {
    return await cartBaseRepository.getCart();

  }


}

