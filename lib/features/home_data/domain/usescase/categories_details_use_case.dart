import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';
import 'package:shop_app/features/home_data/domain/entites/product.dart';

import '../entites/product_details.dart';

class CategoriesDetailsUseCase extends BaseUseCase<List<Product> , CategoriesDetailsParameters>
{
  final HomeBaseRepository homeBaseRepository;

  CategoriesDetailsUseCase(this.homeBaseRepository);


  @override
  Future<Either<Failure, List<Product>>> call(CategoriesDetailsParameters parameters) async
  {
    return await homeBaseRepository.getCategoriesDetails(parameters);
  }

}



class CategoriesDetailsParameters extends Equatable
{
  final int categoriesId;

  const CategoriesDetailsParameters({required this.categoriesId});

  @override
  List<Object?> get props => [categoriesId];
}