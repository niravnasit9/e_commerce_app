import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/product_price_text.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/product_title_text.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                ///  Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageurl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                //   Sale Tag
                if (salePercentage != null)
                  Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      )),

                Positioned(
                  top: 0,
                  right: 0,
                  child: TFavouriteIcon(productId: product.id),
                ),
              ],
            ),
          ),

          ///  Details,Add to Cart,Pricing
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),

                  const Spacer(),

                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///   Price
                      Flexible(
                          child: Column(
                        children: [
                          if (product.productType ==
                                  ProductType.single.toString() &&
                              product.salePrice > 0)
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: Text(
                                product.price.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left: TSizes.sm),
                            child: TProductPriceText(
                                price: controller.getProductPrice(product)),
                          ),
                        ],
                      )),

                      /// Add To Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(Iconsax.add, color: TColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
