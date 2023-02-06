import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/app_string.dart';
import '../../../../core/services/services_locator.dart';
import '../controller/home_cubit.dart';

class BottomNavScreen extends StatelessWidget
{
  final  int? currentIndex;
  const BottomNavScreen({Key? key , required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()
        ..gerBannerData()
        ..getCategoriesData()
        ..getProductData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if(currentIndex != null)
          {
            cubit.currentIndex = currentIndex!;
          }

          return SafeArea(
            child: Scaffold(
              body: cubit.screen[cubit.currentIndex],
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: cubit.currentIndex,
                animationDuration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                showElevation: true,
                onItemSelected: (int value) {
                  cubit.changeBottom(value);
                },
                items: [
                  BottomNavyBarItem(
                    icon: Icon(
                      Icons.home,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0).r,
                      child: Text(
                        AppString.home,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.apply(fontSizeFactor: 1.sp),
                      ),
                    ),
                    activeColor: AppColors.textBodyMediumColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(
                      Icons.favorite,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8.0).r,
                      child: Text(
                        AppString.favorite,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.apply(fontSizeFactor: 1.sp),
                      ),
                    ),
                    activeColor: AppColors.textBodyMediumColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8.0).r,
                      child: Text(
                        AppString.cart,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.apply(fontSizeFactor: 1.sp),
                      ),
                    ),
                    activeColor: AppColors.textBodyMediumColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0).r,
                      child: Text(
                        AppString.settings,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.apply(fontSizeFactor: 1.sp),
                      ),
                    ),
                    activeColor: AppColors.textBodyMediumColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
