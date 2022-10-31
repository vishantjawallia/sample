// ignore_for_file: invalid_required_named_param

import '../config/MyImages.dart';
import '../config/Palettes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String discountPrice;
  final void Function()? onTap;
  const ProductWidget({
    Key? key,
    @required this.imageUrl = "",
    @required this.name = "",
    @required this.price = "",
    @required this.discountPrice = "",
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
        decoration: BoxDecoration(
          color: Palettes.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 5.0)
          ],
        ),
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      height: 15.h,
                      width: 38.w,
                      imageUrl: imageUrl,
                      fadeInDuration: const Duration(seconds: 1),
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                            color: Palettes.primary.withOpacity(0.6)),
                      ),
                      errorWidget: (context, url, error) => MyImages.errorImage,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                      color: Palettes.primary,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Palettes.white,
                            size: 14.sp,
                          ),
                          const Text(
                            '2/4',
                            style: TextStyle(
                              color: Palettes.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 1.h),
                // padding: EdgeInsets.only(left: 4.sp, right: 4.sp, bottom: 12.sp),
                Align(
                  heightFactor: 0.19.h,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 35.w,

                    // padding: const EdgeInsets.only(bottom: 4),
                    // padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Amrit Sweets' ?? name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Northern India, South India' ?? name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Text(
                          //       currency + price + ' ',
                          //       style: const TextStyle(
                          //         fontSize: 12,
                          //         color: Palettes.red,
                          //         fontWeight: FontWeight.w500,
                          //         decoration: TextDecoration.lineThrough,
                          //       ),
                          //     ),
                          //     Text(
                          //       currency + discountPrice,
                          //       style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                          //     ),
                          //     InkWell(
                          //       onTap: onTap,
                          //       child: Icon(
                          //         Icons.add_shopping_cart,
                          //         size: 20.sp,
                          //         color: Palettes.primary,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 5.sp),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
