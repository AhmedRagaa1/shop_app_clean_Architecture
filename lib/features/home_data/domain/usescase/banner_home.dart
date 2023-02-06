import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';

import '../entites/banner.dart';

class BannerUseCase extends BaseUseCase<List<BannerData> , NoParameters>
{
  final HomeBaseRepository homeBaseRepository;

  BannerUseCase(this.homeBaseRepository);
  @override
  Future<Either<Failure, List<BannerData>>> call(NoParameters parameters) async
  {
    return await homeBaseRepository.homeBanner();
  }

}



