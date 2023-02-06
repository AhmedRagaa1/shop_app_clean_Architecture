import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';
import 'package:shop_app/features/home_data/domain/entites/categories.dart';

class CategoriesUseCase extends BaseUseCase<List<Categories> ,NoParameters >
{
  final HomeBaseRepository homeBaseRepository;

  CategoriesUseCase(this.homeBaseRepository);
  @override
  Future<Either<Failure, List<Categories>>> call(NoParameters parameters) async
  {
   return await homeBaseRepository.categoriesType();
  }

}


class CategoriesParameters extends Equatable
{
  final String token;

  const CategoriesParameters(this.token);

  @override
  List<Object?> get props => [token];


}