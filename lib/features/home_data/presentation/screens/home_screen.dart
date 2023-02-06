import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';
import '../components/search_component.dart';
import '../components/banner_component.dart';
import '../components/categories_component.dart';
import '../components/product_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 0).r,
          child: SingleChildScrollView(
            child: Column(children: [
              const SearchComponent(),
              SizedBox(
                height: 30.h,
              ),
              const BannerComponent(),
              SizedBox(
                height: 29.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.categories,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.apply(fontSizeFactor: 1.sp),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  const CategoriesComponent(),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24).r,
                      topRight: Radius.circular(24).r),
                  color: AppColors.myWhite,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, left: 10).r,
                      child: Text(
                        AppString.newProducts,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.apply(fontSizeFactor: 1.sp),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    ProductComponent(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
