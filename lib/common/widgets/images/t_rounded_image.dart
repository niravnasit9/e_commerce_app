import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    required this.imageurl,
    this.applyImageRadius = true,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.borderRadius = TSizes.md,
    this.isNetworkImage = false,
  });

  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
            color: dark ? TColors.dark : TColors.light,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius?BorderRadius.circular(borderRadius):BorderRadius.zero,
          child: Image(fit:fit,image: isNetworkImage ? NetworkImage(imageurl):AssetImage(imageurl) as ImageProvider),
        ),
      ),
    );
  }
}
