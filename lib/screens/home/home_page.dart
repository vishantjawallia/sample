import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:sample/api/apiRepository.dart';
import 'package:sample/models/product.dart';

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../config/demo.dart';
import '../../widgets/CustomProgress.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomProgress(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Container(
                  height: 7.h,
                  padding: const EdgeInsets.fromLTRB(15, 4, 4, 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Palettes.primary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: TextField(
                            onChanged: (String? value) {
                              searchVale(value);
                            },
                            // controller: _search,
                            scrollPadding: EdgeInsets.zero,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Search By HomePages',
                              hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 15.w,
                        decoration: BoxDecoration(
                          color: Palettes.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Palettes.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              /* -------------------------------- HomePages Grid View -------------------------------- */
              productView(),
            ],
          ),
        ),
      ),
    );
  }

  Flexible productView() {
    Stream<Product> products() async* {
      final res = await apiRepository.apiGetRequest('https://fakestoreapi.com/products');
      if (res != null) {
        for (var i = 0; i < res.lenght; i++) {
          log('message');
          Product product = Product.fromJson(res[i]);
          log(product.id.toString());
          log(product.price!.toString());
          log(product.rating!.count!.toString());
          log(product.rating!.rate!.toString());
          log(product.category!);
          log(product.description!);
          log(product.image!);
          log(product.title!);
          yield product;
        }
      }
    }

    return Flexible(
      fit: FlexFit.loose,
      child: StreamBuilder(
        stream: products(),
        builder: (context, snapshot) {
          // log(snapshot.data!.id.toString());
          if (snapshot.hasData) {
            log(snapshot.data!.id.toString());
            log(snapshot.data!.price!.toString());
            log(snapshot.data!.rating!.count!.toString());
            log(snapshot.data!.rating!.rate!.toString());
            log(snapshot.data!.category!);
            log(snapshot.data!.description!);
            log(snapshot.data!.image!);
            log(snapshot.data!.title!);
            return GridView.builder(
              itemCount: productList.length,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/product_detail');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      color: Palettes.white,
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 5.0)],
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            CachedNetworkImage(
                              width: 100.w,
                              imageUrl: "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant2.jpg",
                              fadeInDuration: const Duration(seconds: 1),
                              progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator(color: Palettes.primary.withOpacity(0.6))),
                              errorWidget: (context, url, error) => MyImages.errorImage,
                              fit: BoxFit.fill,
                            ),
                            Align(
                              heightFactor: 0.17.h,
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 35.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text('Amrit Sweets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                                    Text(
                                      'Northern India, South India',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 15.w,
                          height: 2.6.h,
                          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                          color: Palettes.primary,
                          child: Row(
                            children: [
                              Icon(Icons.star_rounded, color: Palettes.white, size: 14.sp),
                              const Text(
                                '2/4',
                                style: TextStyle(color: Palettes.white, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
              ),
            );
          } else if (snapshot.connectionState.index == 1) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text(
              'Product list not found?',
              style: TextStyle(color: Palettes.grey, fontSize: 16.sp),
            ),
          );
        },
      ),
    );
  }

  void searchVale(String? value) {}
}
