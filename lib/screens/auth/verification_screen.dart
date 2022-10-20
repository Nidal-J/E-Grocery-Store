import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/auth/forget_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/auth_dialog.dart';
import 'package:e_grocery/widgets/verification_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isForgetPassword = Get.arguments?['isForget'] ?? false;
  final controller = Get.find<ForgetController>();

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  TextEditingController getController(int index) {
    List<TextEditingController> codeControllers = <TextEditingController>[
      _firstCodeTextController,
      _secondCodeTextController,
      _thirdCodeTextController,
      _fourthCodeTextController,
    ];
    return codeControllers[index];
  }

  FocusNode getFocusNode(int index) {
    List<FocusNode> codeNodes = [
      _firstFocusNode,
      _secondFocusNode,
      _thirdFocusNode,
      _fourthFocusNode,
    ];
    return codeNodes[index];
  }

  Function(String) getFunction(int index) {
    List<Function(String value)> onChangeList = [
      (value) {
        if (value.isNotEmpty) {
          _secondFocusNode.requestFocus();
        }
      },
      (value) {
        value.isNotEmpty
            ? _thirdFocusNode.requestFocus()
            : _firstFocusNode.requestFocus();
      },
      (value) {
        value.isNotEmpty
            ? _fourthFocusNode.requestFocus()
            : _secondFocusNode.requestFocus();
      },
      (value) {
        if (value.isEmpty) {
          _thirdFocusNode.requestFocus();
        }
      },
    ];
    return onChangeList[index];
  }

  @override
  void initState() {
    super.initState();

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 30.w),
              child: Text(
                'verification_message'.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              padding: EdgeInsets.fromLTRB(25.w, 40.h, 25.w, 40.h),
              margin: EdgeInsets.all(16.w),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'enter_code'.tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 70.w, vertical: 30.h),
                    child: SvgPicture.asset('${AppImages.path}/mailbox.svg'),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, crossAxisSpacing: 20.w),
                      itemBuilder: (context, index) => VerificationField(
                        controller: getController(index),
                        focusNode: getFocusNode(index),
                        onChanged: getFunction(index),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'get_no_code'.tr,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                          // fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await _performResend();
                        },
                        child: Text(
                          'resend'.tr,
                          style: const TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(() => Visibility(
                        visible: controller.isResent.value,
                        child: Text(
                          '${'resent_message'.tr}${controller.code}',
                          style: const TextStyle(
                            color: AppColors.danger,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _performVerification();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 56.h),
                    ),
                    child: Text('verify'.tr),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performResend() async {
    // log('performed');
    ApiResponse apiResponse = await AuthApiController()
        .forgetPassword(phoneNumber: controller.phoneNumber.value);
    // log('performed2 ${apiResponse.success}');
    if (apiResponse.success) {
      // controller.phoneNumber(phoneController.text);
      controller.code(int.parse(apiResponse.message));
      controller.isResent(true);
      // showSnackbar(message: 'Verification code is sent');
    } else {
      showSnackbar(
        message: apiResponse.message,
        success: apiResponse.success,
      );
    }
  }

  void _performVerification() {
    String code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
    if (code.isNotEmpty && controller.code.value == int.parse(code)) {
      showDialog(
        context: context,
        // barrierDismissible: controller.isResent.value,
        builder: (context) => AuthDialog(isForgotPassword: isForgetPassword),
      );
      controller.isResent(false);
    } else {
      showSnackbar(
        message: 'code_not_correct'.tr,
        success: false,
      );
    }
  }
}
