import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text('offers_promos_title'.tr),
      ),
      body: NoData(text: 'no_offers'.tr),
    );
  }
}
