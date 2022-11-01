// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:sample/models/product.dart';

import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDetail extends StatelessWidget {
  Product? product;
  ProductDetail(this.product);

  @override
  Widget build(BuildContext context) {
    log(product!.toJson().toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        title: const Text('Products Detail'),
      ),
      body: CustomProgress(
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Hero(
                      tag: product!.id.toString(),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: 40.h,
                          width: 100.w,
                          fadeInDuration: const Duration(seconds: 1),
                          progressIndicatorBuilder: (context, url, progress) => Center(
                            child: CircularProgressIndicator(color: Palettes.primary.withOpacity(0.6)),
                          ),
                          imageUrl: product?.image ?? 'https://firebasestorage.googleapis.com/v0/b/sample-ba5fa.appspot.com/o/home%2Fproduct.png?alt=media&token=1d6d6328-fa76-4d4e-af61-e20e76ec440a',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product?.title ?? 'Coller T-Shit',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: Palettes.primary,
                                      size: 16.sp,
                                    ),
                                    Text(
                                      product?.rating?.rate?.toString() ?? '2.6',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Palettes.primary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '₹${product?.price}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 1.h),

                          /* --------------------------------- Category --------------------------------- */
                          const Text(
                            'Category',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Palettes.primary,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    product!.category!,
                                    style: TextStyle(fontSize: 10.sp, color: Palettes.white),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Palettes.lightGrey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    product?.rating?.count?.toString() ?? '6',
                                    style: const TextStyle(fontSize: 12, color: Palettes.black),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /* ------------------------------- Description ------------------------------ */
                          const Text(
                            'Description',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 0.4.h),
                          Text(
                            product?.description ??
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /* ----------------------------- Two Btn Bottom ----------------------------- */
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: TextButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(width: 2, color: Palettes.primary)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fixedSize: MaterialStateProperty.all(Size.fromHeight(6.h)),
                        backgroundColor: MaterialStateProperty.all(Palettes.primary),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                      child: Text('Add to Cart', style: TextStyle(fontSize: 12.sp, color: Palettes.white)),
                    ),
                  ),
                  SizedBox(
                    width: 35.w,
                    child: TextButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(width: 2, color: Palettes.secondary)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fixedSize: MaterialStateProperty.all(Size.fromHeight(6.h)),
                        backgroundColor: MaterialStateProperty.all(Palettes.secondary),
                      ),
                      onPressed: () {},
                      child: Text('Buy Now', style: TextStyle(fontSize: 12.sp, color: Palettes.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
