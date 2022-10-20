import 'package:e_grocery/api/controllers/categories_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/no_data.dart';
import 'package:e_grocery/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('${Get.arguments?['sub_cat_name']}'.toTitleCase()),
      ),
      body: FutureBuilder<List<Product>?>(
        future: CategoriesApiController()
            .getProducts(Get.arguments?['sub_cat_id'] ?? -1),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data!.isEmpty
                  ? const NoData()
                  : GridView.builder(
                      padding: EdgeInsets.all(20.h),
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 100.w / 150.h,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.productsDetails,
                            arguments: {
                              'product_id': snapshot.data![index].id,
                              'product_name': snapshot.data![index].name,
                            },
                          );
                        },
                        splashColor: AppColors.green,
                        child: ProductCard(product: snapshot.data![index]),
                      ),
                    )
              : GridView.builder(
                  padding: EdgeInsets.all(20.h),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h,
                    childAspectRatio: 100.w / 150.h,
                  ),
                  itemBuilder: (context, index) => Container(
                    width: 150.w,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.lightGrey),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightGrey,
                          blurRadius: 3,
                          spreadRadius: 3,
                          offset: Offset(1, 0),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
