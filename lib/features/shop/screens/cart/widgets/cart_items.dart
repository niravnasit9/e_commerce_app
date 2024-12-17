import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/products/cart/add_remove_button.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/products/cart/cart_item.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/product_price_text.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Items
          TCartItem(),
          if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add Remove Button
                    TProductQuantityWithAddRemove(),
                  ],
                ),

                ///  Product Total Price
                TProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
    );
  }
}
