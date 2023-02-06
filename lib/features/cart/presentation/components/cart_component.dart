import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';
import '../controller/cart_cubit.dart';

class CartComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is QuantityPlusState) {
          print(state.quantity);
        }
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => cartItem(cubit, index, context),
          separatorBuilder: (context, index) =>
          const SizedBox(
            height: 20,
          ),
          itemCount: cubit.cart.cartItems.length,
        );
      },
    );
  }

  Container cartItem(CartCubit cubit, int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.myWhite,
      ),
      padding: EdgeInsets.all(10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.w,
            height: 100.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.myWhite),
            child: Image.network(
              cubit.cart.cartItems[index].productItem!.image,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 160.w,
                child: Text(
                  cubit.cart.cartItems[index].productItem!.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(fontSizeFactor: 1.sp),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 80.w,
                child: Text(
                  '${cubit.cart.cartItems[index].productItem!.price.toInt()} LE ',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(fontSizeFactor: 1.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Theme(
                    data: ThemeData(
                      iconTheme: IconThemeData(
                          size: 20.r, color: AppColors.textBodyMediumColor),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.quantity = cubit.cart.cartItems[index].quantity;
                            cubit.decreaseQuantity();
                            CartCubit.get(context)
                              .updateItemInCart(productId: cubit.cart
                                  .cartItems[index].id,
                                  quantity: cubit.quantity);
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: AppColors.scaffoldColor,
                            child: Icon(
                              Icons.remove,
                              color: AppColors.textBodyMediumColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          cubit.cart.cartItems[index].quantity.toString(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge
                              ?.apply(fontSizeFactor: 1.sp),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: ()
                          {
                            cubit.quantity++;
                            cubit.quantity = cubit.cart.cartItems[index].quantity;
                            cubit.increaseQuantity();
                            CartCubit.get(context)
                              .updateItemInCart(productId: cubit.cart
                                  .cartItems[index].id,
                                  quantity: cubit.quantity);
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: AppColors.scaffoldColor,
                            child: Icon(
                              Icons.add,
                              color: AppColors.textBodyMediumColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  InkWell(
                      onTap: () {
                        cubit.removeItemFromCart(
                            id: cubit.cart.cartItems[index].productItem!.id);
                        print(cubit.cart.cartItems[index].id);
                        print('i deleted successfully in cart');
                      },
                      child: Icon(Icons.delete)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
