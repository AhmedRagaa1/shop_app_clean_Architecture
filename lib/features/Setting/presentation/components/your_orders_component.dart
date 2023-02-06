import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/features/Setting/presentation/controller/setting_cubit.dart';

import 'empty_orders.dart';

class YourOrdersComponent extends StatelessWidget {
  const YourOrdersComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        var cubit = SettingCubit.get(context);
        if ((state is GetOrderLoadingState)) {
          return Center(child: const CircularProgressIndicator());
        } else {
          return (cubit.orders.isEmpty)
              ? const EmptyOrders()
              : Padding(
                  padding: const EdgeInsets.all(22.0).r,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.orders.length,
                    itemBuilder: (context, index) =>
                        (cubit.orders[index].status == 'New' &&
                                cubit.orders[index].total != 0.0)
                            ? yourOrderItem(context, cubit, index)
                            : Container(),
                    separatorBuilder: (context, index) =>
                        (cubit.orders[index].status == 'New' &&
                                cubit.orders[index].total != 0.0)
                            ? SizedBox(
                                height: 20.h,
                              )
                            : SizedBox(
                                height: 0,
                              ),
                  ),
                );
        }
      },
    );
  }

  Container yourOrderItem(BuildContext context, SettingCubit cubit, int index) {
    return Container(
      height: 144.h,
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        borderRadius: BorderRadius.circular(34).r,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 19.0, left: 34),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 63.w,
                  child: Text(
                    AppString.date,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                          fontSizeFactor: 1.sp,
                        ),
                  ),
                ),
                SizedBox(
                  width: 36.w,
                ),
                Text(
                  cubit.orders[index].date,
                  style: Theme.of(context).textTheme.displaySmall?.apply(
                        fontSizeFactor: 1.sp,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    AppString.status,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                          fontSizeFactor: 1.sp,
                        ),
                  ),
                ),
                SizedBox(
                  width: 36.w,
                ),
                Text(
                  cubit.orders[index].status,
                  style: Theme.of(context).textTheme.displaySmall?.apply(
                        fontSizeFactor: 1.sp,
                      ),
                ),
                SizedBox(
                  width: 150.w,
                ),
                InkWell(
                  onTap: ()
                  {
                    cubit.canselOrder(orderId: cubit.orders[index].id);
                  },
                  child: Icon(
                    Icons.delete,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 63.w,
                  child: Text(
                    AppString.total,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                          fontSizeFactor: 1.sp,
                        ),
                  ),
                ),
                SizedBox(
                  width: 36.w,
                ),
                Text(
                  '${cubit.orders[index].total} LE',
                  style: Theme.of(context).textTheme.displaySmall?.apply(
                        fontSizeFactor: 1.sp,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
