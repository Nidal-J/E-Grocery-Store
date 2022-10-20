import 'package:e_grocery/models/api_response.dart';

mixin ApiHelper {
  ApiResponse get failedResponse => const ApiResponse(
        message: 'Something went wrong ?! Please try again.',
        success: false,
      );
}
