import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  BorderRadius borderRadius = BorderRadius.zero,
  Color hintColor = Colors.grey,
  Color prefixColor = Colors.grey,
  Color suffixColor = Colors.grey,
  Function(String val)? onSubmit,
  onChange,
  onTap,
  bool isPassword = false,
  Color borderColor =  Colors.cyanAccent,
  double borderWidth = 1,
  final String? Function(String? val)? validator,
   String? hint,
   prefix,
  int maxLines = 1,
  suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        prefixIcon: Icon(prefix , color: prefixColor,),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix , color: suffixColor,))
            : null,
      ),
    );







Widget defaultMaterialButton ({
  double width = double.infinity,
  Color background = Colors.blue,
  FontWeight fontWeight = FontWeight.bold,
  Color textColor = Colors.blue,
  double fontSize = 20,
  double height =64,
  bool isUppercase =true,
  double raduis = 24,
  required void Function() onPressed,
  required String text,
}) =>
    InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(0, 3), blurRadius: 6 , color: AppColors.primaryColor),
          ],
          borderRadius: BorderRadius.circular(
            raduis.r,
          ),
          color: background,
        ),
        child: Center(
          child: Text(
            isUppercase ?text.toUpperCase() : text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight
            ),

          ),
        ),
      ),
    );
