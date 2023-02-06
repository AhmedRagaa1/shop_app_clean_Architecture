import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';
import 'package:shop_app/features/home_data/presentation/screens/categories_details_screen.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/dummy/dummy_categories.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return (cubit.categoriesCubit.isEmpty) ?const Center(child: CircularProgressIndicator()) :SizedBox(
          height: 157.h,
          child: ListView.separated(
            itemCount: cubit.categoriesCubit.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: ()
                  {
                    navigateTo(context, CategoriesDetailsScreen(categoriesId: cubit.categoriesCubit[index].id));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 133.w,
                        height: 21.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.myWhite,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cubit.categoriesCubit[index].name,
                              style:  Theme.of(context).textTheme.displayMedium?.apply(fontSizeFactor: 1.sp),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(
                        height: 18.h,
                      ),
                      Container(
                        height: 111.h,
                        width: 128.w,
                        decoration: BoxDecoration(
                          color: AppColors.myWhite,
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: NetworkImage(cubit.categoriesCubit[index].image),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (BuildContext context, int index) =>
             SizedBox(
              width: 20.w,
            ),
          ),
        );
      },
    );
  }
}
