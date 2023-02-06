import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/shared%20_pref.dart';

import '../../features/authentication/presentation/screens/login_screen.dart';

String token = '';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget) ,(route) => false);

void customSnakeBar({
   required  context,
   required widget,
  Color? backgroundColor,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget,
      backgroundColor: backgroundColor,
    ));




Widget customAlertDialog({
  Widget? title,
  Widget? content,
  List<Widget>? actions,
  Color? backgroundColor,
  TextStyle? contentStyle,
}) =>
    AlertDialog(
      title: title,
      content: content,
      actions: actions,
      backgroundColor: backgroundColor,
      contentTextStyle: contentStyle,
    );


void signOut(context)
{
  PreferenceUtils.removeData(
      SharedKeys.token).then((value)
  {
    if(value)
    {
      navigateAndRemove(context, LoginScreen());
    }
  });

}
