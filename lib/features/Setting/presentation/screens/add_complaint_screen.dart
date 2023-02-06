import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/Setting/presentation/controller/setting_cubit.dart';
import 'package:shop_app/features/Setting/presentation/screens/setting_screen.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';
import 'package:shop_app/features/home_data/presentation/screens/bottom_nav_screen.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/component_in_general.dart';

class AddComplaintScreen extends StatelessWidget {
  AddComplaintScreen({Key? key}) : super(key: key);

  var formState = GlobalKey<FormState>();
  var complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          elevation: 0,
          title: Row(
            children: [
              Theme(
                data: ThemeData(
                  iconTheme: IconThemeData(
                    size: 12,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: AppColors.myWhite, shape: BoxShape.circle),
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
                AppString.addComplaint,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(fontSizeFactor: 1.sp),
              ),
            ],
          ),
          leading: SizedBox(
            width: 0,
          ),
        ),
        body: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.all(30.0).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  AppString.complaintDs,
                  style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall
                      ?.apply(fontSizeFactor: 1.sp),
                ),
                SizedBox(height: 20.h,),
                defaultTextFormField(
                    controller: complaintController,
                    type: TextInputType.text,
                    borderRadius: BorderRadius
                        .circular(24)
                        .r,
                    maxLines: 8,
                    borderColor: AppColors.primaryColor,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your complaint';
                      }
                    }
                ),
                SizedBox(height: 50.h,),
                BlocConsumer<SettingCubit, SettingState>(
                  listener: (context,state)
                  {
                    if(state is AddComplaintSuccessState)
                    {
                      customSnakeBar(context: context, widget: Text(AppString.complaintMessage) , backgroundColor: AppColors.myGreen);
                      navigateAndRemove(context, BottomNavScreen(currentIndex: null,));
                    }
                  },
                  builder: (context, state)
                  {
                    return defaultMaterialButton(
                      onPressed: ()
                      {
                        if (formState.currentState!.validate())
                        {
                          SettingCubit.get(context).addComplaint(message: complaintController.text);
                          print('aaaaaaaaaaaaaaaa');
                        }
                      },
                      background: Colors.white,
                      text: AppString.send,
                      textColor: AppColors.textBodyMediumColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
