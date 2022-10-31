import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../widgets/CustomProgress.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/GlobalWidget.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => Submit();
}

class Submit extends State<Login> {
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
                  MyImages.login,
                  height: 40.h,
                ),
                Text('Login', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800)),
                SizedBox(height: 1.h),
                Text(
                  'Enter your 10 digit Mobile Number',
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  autofocus: !loading,
                  controller: _phone,
                  hint: 'Enter Your Mobile No.',
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
      Navigator.pushNamed(context, '/otp');
    });
  }

  /* ----------------------------- Google Login ----------------------------- */
  void loginGoogle() {
    GlobalWidget.toast('Google Login');
  }

  /* ----------------------------- Facebook Login ----------------------------- */
  void loginFacebook() {
    GlobalWidget.toast('Facebook Login');
  }
}
