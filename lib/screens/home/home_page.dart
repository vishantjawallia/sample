import 'dart:async';

import 'package:sample/api/apiRepository.dart';
import 'package:sample/models/product.dart';
import 'package:sample/screens/products/product_detail.dart';
import 'package:sample/widgets/ProductWidget.dart';

import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? search = "";

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
                              setState(() {
                                search = value;
                              });
                            },
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
              productView(),
            ],
          ),
        ),
      ),
    );
  }


  /* ------------------------------ Product View List ------------------------------ */
  Flexible productView() {
    Stream<List<Product>> products(String search) async* {
      final res = await apiRepository.getRequest('https://fakestoreapi.com/products');
      if (res != null) {
        List<Product>? product = [];
        for (var value in res) {
          product.add(Product.fromJson(value));
          if (search.isNotEmpty) {
            final sea = product.where((element) => element.title?.toLowerCase().contains(search.toLowerCase()) ?? element.category!.toLowerCase().contains(search.toLowerCase())).toList();
            yield sea;
          } else {
            yield product;
          }
        }
      }
    }

    return Flexible(
      fit: FlexFit.loose,
      child: StreamBuilder(
        stream: products(search!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? GridView.builder(
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetail(snapshot.data![index]))));
                        },
                        child: ProductWidget(snapshot.data![index]),
                      );
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.82,
                    ),
                  )
                : Center(
                    child: Text(
                      'Not Found ?',
                      style: TextStyle(color: Palettes.grey, fontSize: 16.sp),
                    ),
                  );
          } else if (snapshot.connectionState.index == 1) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text(
              'Product List Not Found?',
              style: TextStyle(color: Palettes.grey, fontSize: 16.sp),
            ),
          );
        },
      ),
    );
  }
}
