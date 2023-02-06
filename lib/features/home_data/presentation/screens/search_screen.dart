import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/core/utils/component_in_general.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../components/result_of_search.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.myWhite,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children:
                [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Form(
                            key: formKey,
                            child: defaultTextFormField(
                              controller: searchController,
                              type: TextInputType.text,
                              hint: AppString.search,
                              validator: (value)
                              {
                                if (value!.isEmpty) {
                                  return 'Please enter your product that search on ';
                                }
                              },
                              onSubmit: (value)
                              {
                                if (formKey.currentState!.validate()) {
                                  HomeCubit.get(context).searchAboutItem(
                                      text: searchController.text);
                                }
                                print('aaaaaaaaaaaaaaaaaaaaaaaaa');
                              },
                              prefix: Icons.search,
                              borderRadius: BorderRadius.circular(24.r),
                              borderColor: AppColors.textBodyMediumColor,
                              hintColor: AppColors.primaryColor,
                              prefixColor: AppColors.textBodyMediumColor,

                            ),
                          ),
                          SizedBox(height: 30,),
                          (state is SearchLoadingState)? Center(child: CircularProgressIndicator()) : ResultComponent(),

                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
