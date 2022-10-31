import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDetail extends StatelessWidget {
  // Map product = {"": ""};
  const ProductDetail({
    Key? key,
    // this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      color: Palettes.grey.withOpacity(0.2),
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: 40.h,
                        width: 100.w,
                        fadeInDuration: const Duration(seconds: 1),
                        progressIndicatorBuilder: (context, url, progress) => Center(
                          child: CircularProgressIndicator(color: Palettes.primary.withOpacity(0.6)),
                        ),
                        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/sample-ba5fa.appspot.com/o/home%2Fproduct.png?alt=media&token=1d6d6328-fa76-4d4e-af61-e20e76ec440a',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Coller T-Shit',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                                    const Text(
                                      '2/4',
                                      style: TextStyle(
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
                          Row(
                            children: [
                              const Text(
                                '₹210',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(width: 2.w),
                              const Text(
                                '₹100',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.lineThrough,
                                  color: Palettes.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),

                          /* --------------------------------- Colors --------------------------------- */
                          const Text(
                            'Colors',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 40.sp,
                                    color: Palettes.red,
                                  ),
                                  const Text(
                                    'Red',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 40.sp,
                                    color: Palettes.secondary,
                                  ),
                                  const Text(
                                    'Blue',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 40.sp,
                                    color: Palettes.black,
                                  ),
                                  const Text(
                                    'Black',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),

                          /* --------------------------------- Sizes --------------------------------- */
                          const Text(
                            'Size',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 0.4.h),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Palettes.grey, style: BorderStyle.solid),
                                ),
                                child: const Text(
                                  'M',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Palettes.grey, style: BorderStyle.solid),
                                ),
                                child: const Text(
                                  'L',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Palettes.grey, style: BorderStyle.solid),
                                ),
                                child: const Text(
                                  'XL',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Palettes.grey, style: BorderStyle.solid),
                                ),
                                child: const Text(
                                  '2XL',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),

                          /* ------------------------------- Description ------------------------------ */
                          const Text(
                            'Description',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 0.4.h),
                          Container(
                            child: const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
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
