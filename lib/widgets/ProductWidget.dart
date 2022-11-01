import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample/config/Palettes.dart';
import 'package:sizer/sizer.dart';

import '../config/MyImages.dart';
import '../models/product.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Palettes.white,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 5.0)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: product.id.toString(),
            child: SizedBox(
              width: 95,
              height: 95,
              child: CachedNetworkImage(
                imageUrl: product.image ?? "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant2.jpg",
                fadeInDuration: const Duration(seconds: 1),
                progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator(color: Palettes.primary.withOpacity(0.6))),
                errorWidget: (context, url, error) => MyImages.errorImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rs.${product.price!}',
                  style: TextStyle(color: Palettes.black, fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
                const SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Palettes.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        product.category!,
                        style: TextStyle(fontSize: 10.sp, color: Palettes.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Palettes.lightGrey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        product.rating!.count!.toString(),
                        style: const TextStyle(fontSize: 12, color: Palettes.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  product.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 1),
                Text(
                  'Read more..',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
