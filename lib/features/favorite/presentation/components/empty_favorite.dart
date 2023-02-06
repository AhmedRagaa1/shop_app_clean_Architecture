import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/home_data/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/component_in_general.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 33, right: 33, top: 75, bottom: 65).r,
        child: Column(
          children:
          [
            Container(
              height: 400.7.h,
              width: 410.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
              ),
              child: SvgPicture.asset(
                'assets/images/empty favourite.svg',
              ),
            ),
            SizedBox(height: 5.3.h,),
            Text(
              AppString.emptyFavorite,
              style: Theme.of(context).textTheme.headlineLarge!.apply(fontSizeFactor: 1.sp),
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 268.w,
              child: Text(
                AppString.emptyFavoriteDes,
                style: Theme.of(context).textTheme.headlineSmall!.apply(fontSizeFactor: 1.sp),
              ),
            ),
            SizedBox(height: 110.h,),
            defaultMaterialButton(
              onPressed: ()
              {
                navigateTo(context, const BottomNavScreen(currentIndex: null,));
              },
              background: AppColors.myWhite,
              isUppercase: false,
              text: AppString.shopNow,
              textColor: AppColors.textBodyMediumColor,
              width: 240.w,
            ),
          ],
        ),
      ),
    );
  }
}
