import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/appbar/appbar.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/categories/category_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/cart/cart.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/order.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';


class LoadData extends StatelessWidget {
  const LoadData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryRepository());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Upload Data',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main Record',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Column(
              children: [
                TSettingsMenuTile(
                  icon: Iconsax.category,
                  title: 'Upload Categories',
                  subTitle: 'Upload Categories only one time',
                  trailing: const Icon(Iconsax.document_upload),
                  onTap: () => controller.uploadDummyData,
                ),
                TSettingsMenuTile(
                  icon: Iconsax.shop,
                  title: 'Upload Brands',
                  subTitle: 'Upload Brands only one time',
                  trailing: const Icon(Iconsax.document_upload),
                  onTap: () => Get.to(const CartScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'Upload Products',
                  subTitle: 'Upload Products only one time',
                  trailing: const Icon(Iconsax.document_upload),
                  onTap: () => Get.to(const OrderScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: 'Upload Banners',
                  subTitle: 'Upload Banners only one time',
                  trailing: const Icon(Iconsax.document_upload),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
