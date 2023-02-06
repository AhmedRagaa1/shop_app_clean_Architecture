import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';
import 'package:shop_app/features/home_data/domain/entites/add_cart.dart';



class AddOrRemoveCartUseCase extends BaseUseCase<AddToCart , AddOrRemoveCartParameters>
{
  final HomeBaseRepository homeBaseRepository;

  AddOrRemoveCartUseCase(this.homeBaseRepository);

  @override
  Future<Either<Failure, AddToCart>> call(AddOrRemoveCartParameters parameters) async
  {
    return await homeBaseRepository.addOrRemoveCart(parameters);
  }

}


class AddOrRemoveCartParameters extends Equatable
{
  final int id;

  const AddOrRemoveCartParameters({ required this.id});

  @override
  List<Object?> get props =>
      [
        id,
      ];
}