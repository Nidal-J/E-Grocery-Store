import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationField extends StatelessWidget {
  const VerificationField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 30.sp,
      ),
      textAlign: TextAlign.center,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Color(0xFFE1E1E1),
          ),
        ),
      ),
    );
  }
}
