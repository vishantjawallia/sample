import 'package:pin_code_fields/pin_code_fields.dart';

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import '../../widgets/GlobalWidget.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => Submit();
}

class Submit extends State<Otp> {
  bool loading = false;
  final TextEditingController _phone = TextEditingController();

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
                    fieldOuterPadding: EdgeInsets.all(5.sp),
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
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      // currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                // CustomTextField(
                //   autofocus: !loading,
                //   controller: _phone,
                //   hint: 'Enter Your Mobile No.',
                //   keyboard: TextInputType.phone,
                // ),
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
                // SizedBox(height: 2.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CustomLine(
                //       width: 34.w,
                //       borderWidth: .8.sp,
                //     ),
                //     Text('OR', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)),
                //     CustomLine(
                //       width: 34.w,
                //       borderWidth: .8.sp,
                //     )
                //   ],
                // ),
                // SizedBox(height: 2.h),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         decoration: const BoxDecoration(shape: BoxShape.circle, color: Palettes.primary),
                //         child: IconButton(icon: const FaIcon(FontAwesomeIcons.google, color: Palettes.white), onPressed: OtpGoogle),
                //       ),
                //       Container(
                //         decoration: const BoxDecoration(shape: BoxShape.circle, color: Palettes.primary),
                //         child: IconButton(icon: const FaIcon(FontAwesomeIcons.facebook, color: Palettes.white), onPressed: OtpFacebook),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* --------------------------- Next Submit Handler -------------------------- */
  void submitHandler() {
    setState(() {
      loading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
      GlobalWidget.toast('Next');
      Navigator.pushNamed(context, '/register');
    });
  }

  /* ----------------------------- Google Otp ----------------------------- */
  void OtpGoogle() {
    GlobalWidget.toast('Google Otp');
  }

  /* ----------------------------- Facebook Otp ----------------------------- */
  void OtpFacebook() {
    GlobalWidget.toast('Facebook Otp');
  }
}
