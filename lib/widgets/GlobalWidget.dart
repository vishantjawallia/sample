import '../config/MyImages.dart';
import '../config/demo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class GlobalWidget {
  // static toast(String msg) {
  //   return Fluttertoast.showToast(
  //     msg: msg,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.grey.shade800,
  //     fontSize: 12.sp,
  //   );
  // }

  static drawer(context) {
    return SafeArea(
      child: Drawer(
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              Container(
                height: 28.h,
                width: 100.w,
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        widthFactor: 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(MyImages.men, height: 100),
                            const Icon(Icons.mode_edit_outline_sharp),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sachin Minhas',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Sachinminhas@gmail.com',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      '1451455634656',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: drawerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map obj = drawerList[index];
                    return SizedBox(
                      height: 50,
                      child: ListTile(
                        onTap: () {
                          if (obj['id'] == 8) {
                            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                          }
                        },
                        dense: true,
                        minLeadingWidth: 1,
                        leading: obj['icon'],
                        title: Text('${obj['name']}'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          // color: Palettes.black,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static toast(String? value) {
    return Fluttertoast.showToast(
      msg: "$value",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade700,
      textColor: Colors.white,
    );
  }
}
