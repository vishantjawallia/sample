// ignore_for_file: no_logic_in_create_state

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sample/provider/MainProvider.dart';
import 'package:sample/widgets/GlobalWidget.dart';

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Otp extends StatefulWidget {
  String? phone;
  String? id;
  Otp(this.phone, this.id, {super.key});

  @override
  State<Otp> createState() => Submit(phone, id);
}

class Submit extends State<Otp> {
  String? phone;
  String? id;
  String? otp;
  Submit(this.phone, this.id);
  // bool loading = false;
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final main = Provider.of<MainProvider>(context);
    return Scaffold(
      body: CustomProgress(
        load: context.watch<MainProvider>().loading,
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
                  MyImages.otp,
                  height: 40.h,
                ),
                Text('OTP Verification', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
                SizedBox(height: 1.h),
                Text(
                  'Enter your 6 digit OTP Number',
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.h),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    fieldOuterPadding: EdgeInsets.symmetric(vertical: 5.sp),
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    activeColor: Palettes.primary,
                    inactiveColor: Palettes.primary,
                    inactiveFillColor: Palettes.white,
                    selectedFillColor: Palettes.white,
                    selectedColor: Palettes.primary,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  appContext: context,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* --------------------------- @Next Submit Handler -------------------------- */
  void submitHandler() {
    if (otp!.length != 6) {
      GlobalWidget.toast('Please enter 6 digit otp');
      return;
    }
    final main = Provider.of<MainProvider>(context, listen: false);
    main.otpVerify(context, id!, otp!);
  }
}
