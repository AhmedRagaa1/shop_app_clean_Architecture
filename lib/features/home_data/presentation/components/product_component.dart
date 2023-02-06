import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';

import '../screens/product_details_screen.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return GridView.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5.h,
            crossAxisSpacing: 5.w,
            pattern: [
              const WovenGridTile(5 / 8),
              const WovenGridTile(
                5 / 8,
                alignment: AlignmentDirectional.bottomCenter,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              childCount: cubit.productCubit.length,
              (context, index) => (cubit.productCubit.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : productItem(cubit, index, context)),
        );
      },
    );
  }

  Padding productItem(HomeCubit cubit, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 12, right: 10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  print(' I came ********************');
                  cubit.addItemToFavorite(id: cubit.productCubit[index].id);
                },
                icon: cubit.favorite[cubit.productCubit[index].id] ?? true
                    ? Icon(
                        Icons.favorite,
                        size: Theme.of(context).iconTheme.size,
                        color: Theme.of(context).iconTheme.color,
                      )
                    : Icon(
                        Icons.favorite_border,
                        size: Theme.of(context).iconTheme.size,
                        color: Theme.of(context).iconTheme.color,
                      ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  print(' I came After To Add To Cart ********************');
                  cubit.addItemToCart(id: cubit.productCubit[index].id);
                },
                icon: cubit.cart[cubit.productCubit[index].id] ?? true
                    ? Icon(
                        Icons.shopping_cart,
                        size: Theme.of(context).iconTheme.size,
                        color: Theme.of(context).iconTheme.color,
                      )
                    : Icon(
                        Icons.add_shopping_cart,
                        size: Theme.of(context).iconTheme.size,
                        color: Theme.of(context).iconTheme.color,
                      ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              navigateTo(
                  context,
                  ProductDetailsScreen(
                    productId: cubit.productCubit[index].id,
                  ));
            },
            child: Image(
              image: NetworkImage(cubit.productCubit[index].image),
              width: double.infinity,
              height: 136.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    cubit.productCubit[index].name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.apply(fontSizeFactor: 1.sp),
                  ),
                  height: 40.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      '${cubit.productCubit[index].price.round()} LE',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.apply(fontSizeFactor: 1.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    if (cubit.productCubit[index].discount != 0)
                      Text(
                        '${cubit.productCubit[index].oldPrice.round()}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
