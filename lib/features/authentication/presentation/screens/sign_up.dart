import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/authentication/presentation/screens/login_screen.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/component_in_general.dart';
import '../../../home_data/presentation/screens/bottom_nav_screen.dart';
import '../controller/register_cubit.dart';

class SignUpScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context , state)
        {
          if(state is ShopRegisterSuccessState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.authentication.message) , backgroundColor: AppColors.myGreen,));
            navigateAndRemove(context, BottomNavScreen(currentIndex: null,));
          }

          if(state is ShopRegisterErrorState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error) , backgroundColor:AppColors.myRed,));
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffefede9),
            body: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0 , right: 25 , top: 40 , bottom: 15).r,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(
                              AppString.name,
                              style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            defaultTextFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return 'Please enter your name';
                                }
                              },
                              hint: AppString.name.toLowerCase(),
                              prefix: Icons.supervised_user_circle_outlined,
                              borderRadius: BorderRadius.circular(24.r),
                              borderColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              prefixColor: AppColors.textBodyMediumColor,



                            ),
                          ],
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(
                              AppString.email,
                              style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            defaultTextFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return 'Please enter your email';
                                }
                              },
                              hint: AppString.email.toLowerCase(),
                              prefix: Icons.email,
                              borderRadius: BorderRadius.circular(24.r),
                              borderColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              prefixColor: AppColors.textBodyMediumColor,



                            ),
                          ],
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(
                              AppString.password,
                              style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            defaultTextFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              suffix: RegisterCubit.get(context).suffix,
                              suffixPressed: ()
                              {
                                RegisterCubit.get(context).changePasswordVisibility();
                              },
                              isPassword: RegisterCubit.get(context).isPassword,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return 'Please enter your password';
                                }
                              },
                              hint: 'password',
                              borderRadius: BorderRadius.circular(24.r),
                              prefix: Icons.lock,
                              borderColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              suffixColor: AppColors.textBodyMediumColor,
                              prefixColor: AppColors.textBodyMediumColor,
                            ),
                          ],
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(
                              AppString.phone,
                              style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            defaultTextFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return 'Please enter your phone';
                                }
                              },
                              hint: AppString.phone.toLowerCase(),
                              prefix: Icons.phone,
                              borderRadius: BorderRadius.circular(24.r),
                              borderColor: AppColors.primaryColor,
                              hintColor: AppColors.primaryColor,
                              prefixColor: AppColors.textBodyMediumColor,



                            ),
                          ],
                        ),
                         SizedBox(
                          height: 40.h,
                        ),
                        defaultMaterialButton(
                          onPressed: ()
                          {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                phone: phoneController.text,
                              );
                              print('aaaaaaaaaaaaaaaa');
                            }
                          },
                          background: Colors.white,
                          text: AppString.signUp,
                          textColor: AppColors.textBodyMediumColor,
                        ),
                         SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                            ),
                            TextButton(
                              style: Theme.of(context).textButtonTheme.style,
                              onPressed: () {
                              navigateTo(context, LoginScreen());
                              },
                              child: Text(
                                AppString.signIn.toUpperCase(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
