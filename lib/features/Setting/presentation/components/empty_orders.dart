import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/home_data/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/component_in_general.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding:
      const EdgeInsets.only(left: 33, right: 33, top: 50, bottom: 65).r,
      child: Column(
        children:
        [
          Container(
            height: 420.7.h,
            width: 425.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34.r),
            ),
            child: SvgPicture.asset(
              'assets/images/empty_orders.svg',
            ),
          ),
          SizedBox(height: 15.3.h,),
          Text(
            AppString.emptyOrders,
            style: Theme.of(context).textTheme.headlineLarge!.apply(fontSizeFactor: 1.sp),
          ),
          SizedBox(height: 10.h,),
          Container(
            width: 268.w,
            child: Text(
              AppString.emptyOrdersDes,
              style: Theme.of(context).textTheme.headlineSmall!.apply(fontSizeFactor: 1.sp),
            ),
          ),
          SizedBox(height: 80.h,),
          defaultMaterialButton(
            onPressed: ()
            {
              navigateTo(context, const BottomNavScreen(currentIndex: 2,));
            },
            background: AppColors.myWhite,
            isUppercase: false,
            text: AppString.orderNow,
            textColor: AppColors.textBodyMediumColor,
            width: 240.w,
          ),
        ],
      ),
    );
  }
}
