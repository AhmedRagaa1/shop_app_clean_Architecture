import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_color.dart';

import '../../../../core/services/services_locator.dart';
import '../components/gategories_details_component.dart';
import '../controller/home_cubit.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  final int categoriesId;

  const CategoriesDetailsScreen({Key? key, required this.categoriesId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<HomeCubit>()
        ..getCategoriesDetails(categoriesId: categoriesId),
      child: Scaffold(
        backgroundColor: AppColors.myWhite,
        body: Padding(
          padding: EdgeInsets
              .only(
              top: 20.0, left: 20, right: 20, bottom: 0)
              .r,
          child: SingleChildScrollView(
            child: Column(
              children:
              [
                CategoriesDetailsComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
