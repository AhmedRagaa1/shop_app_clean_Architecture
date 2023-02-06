import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';

import '../entites/search.dart';

class SearchUseCase extends BaseUseCase<List<Search> , SearchParameters>
{
  final HomeBaseRepository homeBaseRepository;

  SearchUseCase(this.homeBaseRepository);

  @override
  Future<Either<Failure, List<Search>>> call(SearchParameters parameters)async
  {
    return await homeBaseRepository.searchAboutProduct(parameters);
  }

}


class SearchParameters extends Equatable
{
  final String text;

  const SearchParameters({required this.text});

  @override
  List<Object?> get props => [text];
}