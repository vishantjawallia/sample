import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:sample/firebase_options.dart';

import '/screens/auth/otp.dart';

import '../config/Palettes.dart';
import '../config/constant.dart';
import '../screens/Home.dart';
import '../screens/Spalsh.dart';
import '../screens/auth/login.dart';
import '../screens/auth/profile.dart';
import '../screens/auth/register.dart';
import '../screens/home/order_page.dart';
import '../screens/products/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,
          theme: ThemeData(
            backgroundColor: Palettes.primary,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Palettes.primary,
              primary: Palettes.primary,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Home(0),
            '/login': (context) => const Login(),
            '/otp': (context) => const Otp(),
            '/profile': (context) => const Profile(),
            '/product_detail': (context) => const ProductDetail(),
            '/splash': (context) => const Splash(),
            '/register': (context) => const Register(),
            '/order': (context) => const OrderPage(),
          },
        );
      },
    );
  }
}
