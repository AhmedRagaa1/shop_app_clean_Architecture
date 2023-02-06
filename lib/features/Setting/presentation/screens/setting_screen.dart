import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/core/utils/component_in_general.dart';
import 'package:shop_app/features/Setting/presentation/screens/add_complaint_screen.dart';
import 'package:shop_app/features/Setting/presentation/screens/get_order_screen.dart';
import 'package:shop_app/features/authentication/presentation/controller/login_cubit.dart';
import 'package:shop_app/features/authentication/presentation/screens/login_screen.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared _pref.dart';
import '../components/get_profile_component.dart';
import '../controller/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingCubit>()..getProfileData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.scaffoldColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.account,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.apply(fontSizeFactor: 1.3.sp),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const GetProfileComponent(),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14.0).r,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 58.h,
                ),
                Text(
                  AppString.settings,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.apply(fontSizeFactor: 1.3.sp),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.primaryColor.withOpacity(.4),
                      child: FaIcon(
                        FontAwesomeIcons.basketShopping,
                        color: AppColors.scaffoldColor,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      AppString.yourOrders,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(fontSizeFactor: 1.3.sp),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    IconButton(
                      onPressed: () {
                        navigateTo(context, GetOrderScreen());
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.primaryColor.withOpacity(.4),
                      child: FaIcon(
                        FontAwesomeIcons.globe,
                        color: AppColors.scaffoldColor,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      AppString.language,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(fontSizeFactor: 1.3.sp),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'English',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.primaryColor.withOpacity(.4),
                      child: SvgPicture.asset(
                        'assets/images/Group 601.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      AppString.addComplaint,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(fontSizeFactor: 1.3.sp),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    IconButton(
                      onPressed: () {
                        navigateTo(context, AddComplaintScreen());
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColors.primaryColor.withOpacity(.4),
                      child: SvgPicture.asset(
                        'assets/images/Group 603.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      AppString.feedback,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(fontSizeFactor: 1.3.sp),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                BlocConsumer<SettingCubit, SettingState>(
                  listener: (context, state) {
                    if (state is LogOutSuccessState) {
                      // PreferenceUtils.removeData(SharedKeys.token);
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => BlocProvider(
                      //               create: (context) => sl<LoginCubit>(),
                      //               child: LoginScreen(),
                      //             )),
                      //     (route) => false);
                    }
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return customAlertDialog(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Are you Sure !!? 😪'),
                                  ],
                                ),
                                contentStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      defaultMaterialButton(
                                        onPressed: () {
                                          signOut(context);
                                          SettingCubit.get(context).logOut();
                                        },
                                        text: 'Yes😥',
                                        height: 50.h,
                                        width: 100.w,
                                        raduis: 24.r,
                                        background: AppColors.myGreen,
                                        textColor:
                                            AppColors.textBodyMediumColor,
                                        fontSize: 17.sp,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      defaultMaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        text: 'No😍',
                                        height: 50.h,
                                        background: AppColors.myRed,
                                        textColor:
                                            AppColors.textBodyMediumColor,
                                        fontSize: 17.sp,
                                        width: 100.w,
                                        raduis: 24.r,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(.4),
                            child: SvgPicture.asset(
                              'assets/images/Export.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(
                            width: 30.h,
                          ),
                          Text(
                            AppString.signOut,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.apply(fontSizeFactor: 1.3.sp),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
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
