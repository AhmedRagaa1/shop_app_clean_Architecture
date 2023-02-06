import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/features/cart/presentation/components/empty_cart.dart';
import 'package:shop_app/features/cart/presentation/controller/cart_cubit.dart';
import 'package:shop_app/features/google_map/presentation/screens/google_map_screen.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/component_in_general.dart';
import '../../../../core/utils/constant.dart';
import '../../../home_data/presentation/screens/bottom_nav_screen.dart';
import '../components/cart_component.dart';

class CartScreen extends StatefulWidget {
  final String? placeDes;
  late bool openDialog = false;

  CartScreen({Key? key, this.placeDes, required this.openDialog})
      : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.openDialog) {
      Timer.run(() => showDialog(
          context: context,
          builder: (context) {
            return customAlertDialogMethod(context);
          }));
    }
  }

  Widget customAlertDialogMethod(BuildContext context) {
    return customAlertDialog(
      backgroundColor: AppColors.scaffoldColor,
      contentStyle: Theme.of(context).textTheme.bodyMedium,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppString.addYourAddress,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.apply(fontSizeFactor: 1.3.sp),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(context, const GoogleMapScreen());
                    },
                    child: Container(
                      width: 230.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: AppColors.myWhite,
                      ),
                      padding: EdgeInsets.only(left: 8).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 180.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            padding: EdgeInsets.only(left: 10).r,
                            child: (widget.placeDes == null)
                                ? Text(
                                    AppString.selectYourAddress,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.apply(fontSizeFactor: 1.3.sp),
                                  )
                                : Text(
                                    widget.placeDes.toString(),
                                    maxLines: 4,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.apply(fontSizeFactor: 1.3.sp),
                                  ),
                          ),
                          const SizedBox(
                            width: 0,
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.myWhite,
                            child: Icon(
                              Icons.place,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocProvider(
                create: (context) => sl<CartCubit>(),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    var cubit = CartCubit.get(context);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.paymentMethod,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.apply(fontSizeFactor: 1.3.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 1,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => AppColors.textBodyMediumColor),
                                groupValue: cubit.val,
                                onChanged: ((value) {
                                  value = int.parse(value.toString());
                                  cubit.changeRadioButtonValue(value);
                                })),
                            Text(
                              AppString.cash,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.apply(fontSizeFactor: 1.3.sp),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Radio(
                                value: 2,
                                groupValue: cubit.val,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => AppColors.textBodyMediumColor),
                                onChanged: ((value) {
                                  value = int.parse(value.toString());
                                  cubit.changeRadioButtonValue(value);
                                })),
                            Text(
                              AppString.visa,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.apply(fontSizeFactor: 1.3.sp),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocProvider(
                create: (context) => sl<CartCubit>(),
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is AddOrderSuccessState) {
                      customSnakeBar(
                          context: context,
                          widget: const Text(
                            AppString.orderMessageSuccessfully,
                          ),
                          backgroundColor: AppColors.myGreen);
                      navigateTo(
                          context,
                          const BottomNavScreen(
                            currentIndex: null,
                          ));
                    }
                  },
                  builder: (context, state) {
                    return defaultMaterialButton(
                      onPressed: () {
                        if (widget.placeDes != null) {
                          CartCubit.get(context).addOrder();
                        }
                      },
                      text: AppString.orderNow,
                      background: AppColors.myWhite,
                      isUppercase: false,
                      textColor: AppColors.textBodyMediumColor,
                      raduis: 24.r,
                      width: 150.w,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>()..getCartData(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return Scaffold(
            body: (state is GetCartLoadingState)
                ? const Center(child: CircularProgressIndicator())
                : (cubit.cart.cartItems.isEmpty)
                    ? const EmptyCart()
                    : Padding(
                        padding: const EdgeInsets.only(
                                left: 60, right: 45, top: 25, bottom: 58)
                            .r,
                        child: Column(
                          children: [
                            Expanded(child: CartComponent()),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0).r,
                                  child: const Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0).r,
                                  child: Row(
                                    children: [
                                      Text(
                                        AppString.cartTotal,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.apply(fontSizeFactor: 1.2.sp),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 17.0)
                                                .r,
                                        child:
                                            BlocBuilder<CartCubit, CartState>(
                                          builder: (context, state) {
                                            var cubit = CartCubit.get(context);
                                            return Text(
                                              '${cubit.cart.total} LE',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.apply(
                                                      fontSizeFactor: 1.2.sp),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 33.h,
                                ),
                                defaultMaterialButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return customAlertDialogMethod(
                                              context);
                                        });
                                    // print('order came ya walllllllllllllllllll');
                                    // CartCubit.get(context).addOrder();
                                  },
                                  background: AppColors.myWhite,
                                  isUppercase: false,
                                  text: AppString.checkOut,
                                  textColor: AppColors.textBodyMediumColor,
                                  width: 240.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
