import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_color.dart';
import '../controller/home_cubit.dart';

class PageViewComponent extends StatelessWidget {
  PageViewComponent({Key? key}) : super(key: key);

  PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Column(
          children: [
            Container(
              height: 450.h,
              color: AppColors.myWhite,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  print(index);
                },
                controller: boardController,
                itemBuilder: (context, index) => Image(
                  image: NetworkImage(cubit.productDetails.images[index]),
                  width: double.infinity,
                ),
                itemCount: cubit.productDetails.images.length,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColors.primaryColor,
                    activeDotColor: AppColors.textBodyMediumColor,
                    dotHeight: 10.h,
                    expansionFactor: 4,
                    dotWidth: 10.w,
                    spacing: 5,
                  ),
                  count: cubit.productDetails.images.length,
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(18.0).r,
              child: Column(
                children:
                [
                  Row(
                    children: [
                      Container(
                          width: 230.w,
                          child: Text(
                            cubit.productDetails.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.apply(fontSizeFactor: 1.sp),
                            maxLines: 3,
                          )),
                      Spacer(),
                      Text(
                        '${cubit.productDetails.price.toString()} LE',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.apply(fontSizeFactor: 1.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  SingleChildScrollView(
                    child: Container(
                        child: Text(
                          cubit.productDetails.description,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.apply(fontSizeFactor: 1.sp),
                          maxLines: 10,
                        )),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
