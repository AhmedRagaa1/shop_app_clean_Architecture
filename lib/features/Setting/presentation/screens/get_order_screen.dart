import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/features/Setting/presentation/controller/setting_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../components/your_orders_component.dart';

class GetOrderScreen extends StatelessWidget {
  const GetOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<SettingCubit>()..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          elevation: 0,
          title: Row(
            children: [
              Theme(
                data: ThemeData(
                  iconTheme: IconThemeData(
                    size: 16,
                    color: AppColors.textBodyMediumColor,
                  ),
                ),
                child: InkWell(
                  onTap: ()
                  {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: AppColors.myWhite,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 120.w,
              ),
              Text(
                AppString.yourOrders,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(fontSizeFactor: 1.sp),
              ),
            ],
          ),
          leading: SizedBox(width: 0,),

        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children:
            [
              SizedBox(
                height: 40.h,
              ),
              YourOrdersComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
