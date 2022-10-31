import '../config/MyImages.dart';
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
            child: Image.asset(
              MyImages.logo,
              width: 300,
            ),
          );
        },
      ),
    );
  }

  Future<void> splashLoad(context) async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
}
