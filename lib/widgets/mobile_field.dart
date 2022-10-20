import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class MobileField extends StatelessWidget {
  const MobileField({
    Key? key,
    required this.mobileController,
  }) : super(key: key);

  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mobileController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'required_error_message'.tr;
        } else if (value.length != 9) {
          return 'length_error_message'.tr;
        }
        return null;
      },
      maxLength: 9,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      style: const TextStyle(letterSpacing: 1.2),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        prefix: Container(
          height: 32.h,
          width: 60.w,
          alignment: Alignment.center,
          padding: EdgeInsetsDirectional.only(end: 8.w),
          margin: EdgeInsetsDirectional.only(end: 12.w),
          decoration: const BoxDecoration(
            border: BorderDirectional(
              end: BorderSide(
                width: 1,
                color: AppColors.green,
              ),
            ),
          ),
          child: Text(
            '+970',
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
        counterText: '',
        // hintText: '59xxxxxxx',
        fillColor: AppColors.lightGrey,
        filled: true,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
