import 'package:e_grocery/api/controllers/categories_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/sub_category.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GetBackButton(),
        title: Text('${Get.arguments?['cat_name']}'.toTitleCase()),
      ),
      body: FutureBuilder<List<SubCategory>?>(
        future: CategoriesApiController()
            .getSubCategories(Get.arguments?['cat_id'] ?? -1),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? snapshot.data!.isEmpty
                  ? const NoData()
                  : GridView.builder(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 105.w / 120.h,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.productsScreen,
                            arguments: {
                              'sub_cat_id': snapshot.data![index].id,
                              'sub_cat_name': snapshot.data![index].nameEn,
                            },
                          );
                        },
                        splashColor: AppColors.green,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 47.r,
                              backgroundColor: Colors.transparent,
                              child: Image.network(
                                snapshot.data![index].imageUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              snapshot.data![index].nameEn.toTitleCase(),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
              : GridView.builder(
                  itemCount: 15,
                  padding: EdgeInsets.all(20.r),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 105.w / 120.h,
                  ),
                  itemBuilder: (context, index) => CircleAvatar(
                    radius: 47.r,
                    backgroundColor: AppColors.lightGrey,
                  ),
                );
        },
      ),
    );
  }
}
