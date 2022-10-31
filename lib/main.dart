import 'package:flutter/material.dart';
import 'package:sample/screens/Home.dart';
import 'package:sample/screens/auth/login.dart';

import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        'login': (context) => const Login(),
      },
    );
  }
}
