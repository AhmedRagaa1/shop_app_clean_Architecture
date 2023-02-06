import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../controller/setting_cubit.dart';

class GetProfileComponent extends StatelessWidget {
  const GetProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state)
      {
        var cubit = SettingCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
          [
            Container(
              decoration: BoxDecoration(
                boxShadow:
                [
                  BoxShadow(offset: Offset(3,3), blurRadius: 6, color: AppColors.shadowSearchHomeColor),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(cubit.getProfile.image),
              ),
            ),
             SizedBox(
              width: 30.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.getProfile.name,
                  style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                ),
                 SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 220.w,
                  child: Text(
                    cubit.getProfile.email,
                    style: Theme.of(context).textTheme.titleSmall?.apply(fontSizeFactor: 1.2.sp ),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        );
      },
    );
  }
}
