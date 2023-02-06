import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';
import 'package:shop_app/features/home_data/domain/entites/product.dart';

import '../../../../core/base_use_case/base_use_case.dart';

class ProductUseCase extends BaseUseCase<List<Product> , NoParameters >
{
  final HomeBaseRepository homeBaseRepository;

  ProductUseCase(this.homeBaseRepository);
  @override
  Future<Either<Failure, List<Product>>> call(NoParameters parameters) async
  {
   return await homeBaseRepository.homeProduct();
  }
}




class ProductParameters extends Equatable
{
  final String token;

  const ProductParameters(this.token);

  @override
  List<Object?> get props => [token];


}