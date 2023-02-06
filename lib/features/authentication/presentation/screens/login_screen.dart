import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utils/app_color.dart';
import 'package:shop_app/core/utils/app_string.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/authentication/presentation/controller/login_cubit.dart';
import 'package:shop_app/features/authentication/presentation/screens/sign_up.dart';
import 'package:shop_app/features/home_data/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/component_in_general.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context , state)
        {
          if(state is LoginSuccessState)
          {
            customSnakeBar(context: context , widget: Text(state.authentication.message) , backgroundColor: AppColors.myGreen);
            navigateAndRemove(context, BottomNavScreen(currentIndex: null,));
          }

          if(state is LoginErrorState)
          {
            customSnakeBar(context: context , widget: Text(state.error) , backgroundColor: AppColors.myRed);
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(25.0).r,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(
                          AppString.loginDes,
                          style:  Theme.of(context).textTheme.bodyLarge?.apply(fontSizeFactor: 1.sp),
                        ),
                         SizedBox(
                          height: 55.h,
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
                              borderColor: AppColors.textBodyMediumColor,
                              hintColor: AppColors.primaryColor,
                              prefixColor: AppColors.textBodyMediumColor,



                            ),
                          ],
                        ),
                         SizedBox(
                          height: 25.h,
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
                              suffix: LoginCubit.get(context).suffix,
                              suffixPressed: ()
                              {
                                LoginCubit.get(context).changePasswordVisibility();
                              },
                              isPassword: LoginCubit.get(context).isPassword,
                                validator: (value)
                                {
                                  if (value!.isEmpty)
                                  {
                                    return 'Please enter your password';
                                  }
                                },
                                hint: AppString.password.toLowerCase(),
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
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [
                            InkWell(
                              onTap: (){},
                              child: Text(
                                  AppString.forgotPassword,
                                style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                              ),
                            )
                          ],
                        ),
                         SizedBox(
                          height: 35.h,
                        ),
                        defaultMaterialButton(
                            onPressed: ()
                            {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).signIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                );
                                print('aaaaaaaaaaaaaaaa');
                              }

                            },
                          background: Colors.white,
                            text: AppString.signIn,
                          textColor: AppColors.textBodyMediumColor,
                        ),
                         SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a Member Yet?',
                              style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3.sp),
                            ),
                            TextButton(
                              style: Theme.of(context).textButtonTheme.style,
                              onPressed: ()
                              {
                                navigateTo(context, SignUpScreen());
                              },
                              child: Text(
                                AppString.signUp.toUpperCase(),
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
