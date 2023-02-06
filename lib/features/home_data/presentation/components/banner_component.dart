import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';

import '../../../../core/utils/dummy/dummy_banner.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return (cubit.bannerCubit.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : CarouselSlider.builder(
              itemCount: cubit.bannerCubit.length,
              itemBuilder: (context, index, int) => Image.network(
                cubit.bannerCubit[index].image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              options: CarouselOptions(
                scrollPhysics: const ScrollPhysics(),
                height: 120.h,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            );
      },
    );
  }
}
