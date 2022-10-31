// ignore_for_file: non_constant_identifier_names

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/GlobalWidget.dart';
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
  // bool customer = true;
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
                Text('Sign Up',
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w800)),
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
                Align(
                  widthFactor: 0.229.w,
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.comfortable,
                        checkColor: Colors.white,
                        focusColor: Palettes.primary,
                        activeColor: Palettes.primary,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        "I agreed to NearTake's ",
                        style: TextStyle(fontSize: 11.sp),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: Palettes.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 30.w,
                  height: 5.h,
                  child: TextButton(
                    style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor:
                            MaterialStateProperty.all(Palettes.primary)),
                    onPressed: submitHandler,
                    child: Text('Sign Up',
                        style:
                            TextStyle(fontSize: 12.sp, color: Palettes.white)),
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
