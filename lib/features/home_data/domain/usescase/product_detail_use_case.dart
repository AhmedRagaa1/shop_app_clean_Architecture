import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';

import '../entites/product_details.dart';

class ProductDetailsUseCase extends BaseUseCase<ProductDetails , ProductDetailsParameters>
{
  final HomeBaseRepository homeBaseRepository;

  ProductDetailsUseCase(this.homeBaseRepository);

  @override
  Future<Either<Failure, ProductDetails>> call(ProductDetailsParameters parameters) async
  {
    return await homeBaseRepository.getProductDetails(parameters);
  }
}


class ProductDetailsParameters extends Equatable
{
  final int productId;

  const ProductDetailsParameters({required this.productId});

  @override
  List<Object?> get props => [productId];
}