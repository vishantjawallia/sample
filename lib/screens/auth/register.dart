// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sample/api/firestoreRepository.dart';
import 'package:sample/provider/MainProvider.dart';
import 'package:sample/widgets/GlobalWidget.dart';
// import 'package:sample/api/firestoreRepository.dart';
// import 'package:sample/provider/MainProvider.dart';

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import '../../widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  bool isChecked = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fire = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomProgress(
        load: loading,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 100.h,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MyImages.register,
                  width: 40.h,
                ),
                SizedBox(height: 1.h),
                Text('Sign Up', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
                SizedBox(height: 2.h),
                CustomTextField(
                  autofocus: !loading,
                  controller: _name,
                  hint: 'Full Name',
                  keyboard: TextInputType.name,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  controller: _email,
                  hint: 'Email',
                  keyboard: TextInputType.emailAddress,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  controller: TextEditingController(text: auth.currentUser!.phoneNumber),
                  readOnly: true,
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 30.w,
                  height: 5.h,
                  child: TextButton(
                    style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap, backgroundColor: MaterialStateProperty.all(Palettes.primary)),
                    onPressed: submitHandler,
                    child: Text('Sign Up', style: TextStyle(fontSize: 12.sp, color: Palettes.white)),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* ----------------------------- Submit Handler ----------------------------- */
  void submitHandler() async {
    final main = Provider.of<MainProvider>(context, listen: false);

    main.loading = true;
    Map<String, dynamic> data = {
      "uid": auth.currentUser!.uid,
      "name": _name.text,
      "phone": auth.currentUser!.phoneNumber,
      "email": _email.text,
    };
    final res = await firestoreRepository.apiCreate(data, 'users/${auth.currentUser!.uid}');
    if (res != null) {
      GlobalWidget.toast('Profile updated successfully');
      main.loading = false;
      Navigator.pushReplacementNamed(context, '/');
    }
  }
}
