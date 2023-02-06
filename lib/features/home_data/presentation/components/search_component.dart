import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/home_data/presentation/screens/search_screen.dart';

import '../../../../core/utils/app_color.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: ()
          {
            navigateTo(context, SearchScreen());
          },
          child: Container(
            width: 300.h,
            height: 42.h,
            decoration: BoxDecoration(
                color: AppColors.myWhite,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 6,
                      color: AppColors.shadowSearchHomeColor),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    AppString.search,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 44.h,
          height: 42.h,
          decoration: BoxDecoration(
            color: AppColors.myWhite,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
