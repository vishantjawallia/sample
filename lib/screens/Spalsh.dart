import 'package:provider/provider.dart';
import 'package:sample/provider/MainProvider.dart';
import 'package:sizer/sizer.dart';

import '../config/Palettes.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: splashLoad(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  Palettes.primary,
                  Palettes.white,
                ],
              ),
            ),
            child: Center(
              child: Text(
                'E-commerce',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> splashLoad(context) async {
    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser != null) {
        if (auth.currentUser!.uid.isEmpty) {
          Provider.of<MainProvider>(context, listen: false).signOut(context);
          return;
        }
        Navigator.pushReplacementNamed(context, '/');
      } else {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }
}
