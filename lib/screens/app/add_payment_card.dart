import 'package:e_grocery/api/controllers/payment_cards_api_controller.dart';
import 'package:e_grocery/get/controllers/payment_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/models/payment_card.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddPaymentCard extends StatefulWidget {
  const AddPaymentCard({Key? key}) : super(key: key);

  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  final paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: const Text('Add Payment Card'),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 30.h),
        children: [
          Image.asset(
            '${AppImages.paymentCardPath}/visa_master_card.png',
            height: 250,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 26.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterField(
                  label: 'Holder Name',
                  controller: paymentController.holderNameController,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Card Type',
                  style: AppFonts.label,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 56.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: Obx(
                    () => DropdownButton<String>(
                      borderRadius: BorderRadius.circular(7.r),
                      isExpanded: true,
                      value: paymentController.cardType.value,
                      items: const [
                        DropdownMenuItem(
                          value: 'Visa',
                          child: Text('Visa Card'),
                        ),
                        DropdownMenuItem(
                          value: 'Master',
                          child: Text('Master Card'),
                        ),
                        DropdownMenuItem(
                          enabled: false,
                          child: Text(
                            'Paypal',
                            style: TextStyle(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          enabled: false,
                          child: Text(
                            'Google Pay',
                            style: TextStyle(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (type) {
                        paymentController.cardType(type);
                      },
                    ),
                  )),
                ),
                SizedBox(
                  height: 25.h,
                ),
                RegisterField(
                  label: 'Card Number',
                  controller: paymentController.cardNumberController,
                  textInputType: TextInputType.number,
                  maxLength: 16,
                  // onChanged: (value) {
                  //   if (value.length == 4) {
                  //     log(value);
                  //     paymentController.cardNumberController.text += ' ';
                  //   }
                  // }
                  // paymentController.cardNumberController.text = value;
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: RegisterField(
                          label: 'CVV Number',
                          controller: paymentController.cvvController,
                          maxLength: 3,
                        ),
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              style: AppFonts.label,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 56.h,
                              alignment: AlignmentDirectional.centerStart,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: AppColors.green,
                                              //   onPrimary: Colors.redAccent,
                                              //   onSurface: Colors.blueAccent,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      });

                                  if (selectedDate != null) {
                                    paymentController.expDate.value =
                                        selectedDate;
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() => Text(
                                          '${paymentController.expDate.value.day} - ${paymentController.expDate.value.month} - ${paymentController.expDate.value.year}',
                                        )),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await _performSave();
                        },
                        child: const Text('Confirm'),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performSave() async {
    ApiResponse apiResponse = await PaymentCardsApiController()
        .createPaymentCard(paymentCard: paymentCard);
    if (apiResponse.success) {
      Get.back();
    }
    showSnackbar(
      message: apiResponse.message,
      success: apiResponse.success,
    );
  }

  final PaymentCard _paymentCard = PaymentCard();

  PaymentCard get paymentCard {
    _paymentCard.type = paymentController.cardType.value;
    _paymentCard.holderName = paymentController.holderNameController.text;
    _paymentCard.cardNumber = paymentController.cardNumberController.text;
    _paymentCard.cvv = paymentController.cvvController.text;
    _paymentCard.expDate = expiaryDate;
    debugPrint(_paymentCard.expDate);
    return _paymentCard;
  }

  String get expiaryDate {
    String day = paymentController.expDate.value.day.toString();
    String month = paymentController.expDate.value.month.toString();
    String year = paymentController.expDate.value.year.toString();
    if (month.length == 1) {
      month = '0$month';
    }
    if (day.length == 1) {
      day = '0$day';
    }
    return '$year-$month-$day';
  }
}
