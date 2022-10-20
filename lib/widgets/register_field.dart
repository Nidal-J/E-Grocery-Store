import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    required this.label,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.condition = false,
    this.message,
    this.autoFocus = false,
    this.prefix,
    this.suffixIcon,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.isPassword = false,
    this.isPhoneNumber = false,
    Key? key,
  }) : super(key: key);
  final String label;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool obscureText;
  final bool autoFocus;
  final bool condition;
  final bool isPassword;
  final bool isPhoneNumber;
  final String? message;
  final Widget? prefix;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.label,
        ),
        SizedBox(
          height: 10.h,
        ),
        Directionality(
          textDirection: (isPhoneNumber || deviceLocale == 'en')
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'required_error_message'.tr;
              } else if (isPassword && value.length < 8) {
                return 'password_length_error_message'.tr;
              } else if (isPhoneNumber && value.length != 9) {
                return 'phone_length_error_message'.tr;
              } else if (condition) {
                return message;
              }
              return null;
            },
            minLines: minLines,
            maxLines: maxLines,
            maxLength: isPhoneNumber ? 9 : maxLength,
            obscureText: obscureText,
            textInputAction: textInputAction,
            keyboardType: isPhoneNumber ? TextInputType.phone : textInputType,
            autofocus: autoFocus,
            onChanged: onChanged,
            style: TextStyle(
              letterSpacing: 1.2.r,
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              counterText: '',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              errorMaxLines: 2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.r),
                borderSide: const BorderSide(
                  color: Color(0xFFE0E0E0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.green,
                ),
              ),
              suffixIcon: suffixIcon,
              prefix: isPhoneNumber
                  ? Container(
                      width: 70.w,
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.only(end: 8.w),
                      margin: EdgeInsetsDirectional.only(end: 12.w),
                      decoration: const BoxDecoration(
                        border: BorderDirectional(
                          end: BorderSide(width: 1, color: AppColors.green),
                        ),
                      ),
                      child: Text(
                        '+970',
                        style: TextStyle(
                          letterSpacing: 1.2.r,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  : prefix,
            ),
          ),
        ),
      ],
    );
  }
}
