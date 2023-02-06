import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/favorite/presentation/controller/favorite_cubit.dart';

import '../../../../core/utils/app_color.dart';
import 'empty_favorite.dart';

class FavoriteComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return (state is GetFavoriteLoadingState)
            ? Center(child: CircularProgressIndicator())
            : (cubit.favorite.isEmpty) ? const EmptyFavorite() :Padding(
            padding: const EdgeInsets.only(left: 60 , right: 45 ,top: 25).r,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      favoriteItem(cubit, index, context),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 28.h,
                  ),
                  itemCount: cubit.favorite.length,
                ),
            );
      },
    );
  }

  Container favoriteItem(FavoriteCubit cubit, int index, BuildContext context) {
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
            height: 110.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.myWhite
            ),
            child: Image.network(
              cubit.favorite[index].productItemFavorite!.image,
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
                height: 60.h,
                width: 160.w,
                child: Text(
                  cubit.favorite[index].productItemFavorite!.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(fontSizeFactor: 1.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 125).r,
                child: InkWell(
                    onTap: () {
                      cubit.removeItemFromFavorite(
                          id: cubit.favorite[index].productItemFavorite!.id);
                      print(
                          'i deleted successfully /////// ///// ////////////');
                    },
                    child: Icon(Icons.favorite)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 80.w,
                    child: Text(
                      '${cubit.favorite[index].productItemFavorite!.price.toInt()} LE ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.apply(fontSizeFactor: 1.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
