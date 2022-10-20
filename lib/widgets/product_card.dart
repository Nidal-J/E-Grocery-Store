import 'package:e_grocery/api/controllers/favorite_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/models/product.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.isFavorite = false,
  }) : super(key: key);

  final Product product;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.lightGrey),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey,
            blurRadius: 3.r,
            spreadRadius: 3.r,
            offset: Offset(1.r, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () async {
                // storeController.isFavorite.value =
                //     !storeController.isFavorite.value;
                await FavoriteApiController().postFavoriteProduct(product.id);
                // productController.isFavorite.value = product.isFavorite;
              },
              child: Icon(
                product.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                size: 18.w,
                color: product.isFavorite ? AppColors.danger : AppColors.grey,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.productsDetails, arguments: {
                  'product_id': product.id,
                  'product_name': product.name,
                });
              },
              child: Image.network(
                product.imageUrl,
                height: 100.h,
                // width: 150,
                // fit: BoxFit.none,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            product.name.toTitleCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              if (product.offerPrice != null)
                Row(
                  children: [
                    Text(
                      '${product.offerPrice!} \$',
                      style: const TextStyle(
                        // fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              Text(
                '${product.price} \$',
                style: const TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: double.tryParse(product.overalRate) == 0.0 ||
                        double.tryParse(product.overalRate) == null
                    ? AppColors.grey
                    : AppColors.warning,
              ),
              SizedBox(width: 5.w),
              Text(
                product.overalRate,
                style: TextStyle(
                  color: int.tryParse(product.overalRate) == 0 ||
                          int.tryParse(product.overalRate) == null
                      ? AppColors.grey
                      : AppColors.warning,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
