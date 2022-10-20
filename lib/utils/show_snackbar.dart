import 'package:e_grocery/constants/constants.dart';
import 'package:get/get.dart';

void showSnackbar({
  String? title,
  required String message,
  bool success = true,
  int duration = 3,
}) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      backgroundColor: success ? AppColors.green : AppColors.danger,
      message: message,
      duration: Duration(seconds: duration),
      // snackStyle: SnackStyle.GROUNDED,
    ),
  );
}
