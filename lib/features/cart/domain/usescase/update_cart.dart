import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/cart/domain/baserepository/cart_base_repository.dart';
import 'package:shop_app/features/cart/domain/entites/update_cart.dart';

class UpdateCartUseCase extends BaseUseCase<UpdateCart , UpdateCartParameters>
{
  final CartBaseRepository cartBaseRepository;

  UpdateCartUseCase(this.cartBaseRepository);

  @override
  Future<Either<Failure, UpdateCart>> call(UpdateCartParameters parameters) async
  {
   return await cartBaseRepository.updateCart(parameters);
  }

}



class UpdateCartParameters extends Equatable
{
  final int productId;
  final int quantity;

  const UpdateCartParameters({required this.productId, required this.quantity});

  @override
  List<Object?> get props =>
      [
        productId,
        quantity,
      ];
}