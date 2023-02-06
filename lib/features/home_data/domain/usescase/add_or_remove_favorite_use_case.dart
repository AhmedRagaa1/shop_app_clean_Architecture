import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';

import '../entites/add_favorite.dart';


class AddOrRemoveFavoriteUseCase extends BaseUseCase<AddFavorite , AddOrRemoveFavoriteParameters>
{
  final HomeBaseRepository homeBaseRepository;

  AddOrRemoveFavoriteUseCase(this.homeBaseRepository);

  @override
  Future<Either<Failure, AddFavorite>> call(AddOrRemoveFavoriteParameters parameters) async
  {
    return await homeBaseRepository.addOrRemoveFavorite(parameters);
  }

}


class AddOrRemoveFavoriteParameters extends Equatable
{
  final int id;

  const AddOrRemoveFavoriteParameters({ required this.id});

  @override
  List<Object?> get props =>
      [
        id,
      ];
}