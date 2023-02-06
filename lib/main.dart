import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/services/services_locator.dart';
import 'package:shop_app/core/theme/light_theme.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/core/utils/shared%20_pref.dart';
import 'package:shop_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:shop_app/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'core/utils/app_string.dart';
import 'features/Setting/presentation/components/empty_orders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await PreferenceUtils.init();
  await ScreenUtil.ensureScreenSize();

  Widget widget;
  token = PreferenceUtils.getString(SharedKeys.token);

  print(token);
  (token == '') ? widget = LoginScreen() : widget = const BottomNavScreen(currentIndex: null,);

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({super.key, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: AppString.appName,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: startWidget,



        );
      },
    );
  }
}
