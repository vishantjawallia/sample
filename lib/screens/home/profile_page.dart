// ignore_for_file: non_constant_identifier_names

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/GlobalWidget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loading = false;
  bool customer = true;
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pin = TextEditingController();
  final TextEditingController _firm = TextEditingController();
  final TextEditingController _gst = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: CustomProgress(
        load: loading,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              // height: 100.h,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Image.asset(MyImages.men, height: 100),
                  Text('Edit Profile', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    autofocus: !loading,
                    controller: _name,
                    hint: 'Name',
                    keyboard: TextInputType.phone,
                  ),
                  SizedBox(height: 1.h),
                  CustomTextField(
                    controller: _email,
                    hint: 'Email',
                    keyboard: TextInputType.phone,
                  ),
                  SizedBox(height: 1.h),
                  CustomTextField(
                    controller: _address,
                    hint: 'Address',
                    keyboard: TextInputType.phone,
                  ),
                  SizedBox(height: 1.h),
                  CustomTextField(
                    controller: _pin,
                    hint: 'Pincode',
                    keyboard: TextInputType.phone,
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 30.w,
                    height: 5.h,
                    child: TextButton(
                      style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap, backgroundColor: MaterialStateProperty.all(Palettes.primary)),
                      onPressed: submitHandler,
                      child: Text('Next', style: TextStyle(fontSize: 12.sp, color: Palettes.white)),
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /* ----------------------------- Submit Handler ----------------------------- */
  void submitHandler() {
    Map data = {
      "name": "",
      "email": "",
      "address": "",
      "pincode": "",
    };
    setState(() {
      loading = true;
    });
    GlobalWidget.toast('Next');
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
      Navigator.pushNamed(context, '/');
    });
  }
}
