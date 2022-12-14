import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sample/firebase_options.dart';
import 'package:sample/provider/MainProvider.dart';

import '../config/Palettes.dart';
import '../config/constant.dart';
import '../screens/Home.dart';
import '../screens/Spalsh.dart';
import '../screens/auth/login.dart';
import '../screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: providers, child: const MyApp()));
  // runApp(const MyApp());
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider()),
];

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
          initialRoute: 'splash',
          routes: {
            '/': (context) => Home(0),
            'splash': (context) => const Splash(),
            'login': (context) => const Login(),
            'register': (context) => const Register(),
          },
        );
      },
    );
  }
}
