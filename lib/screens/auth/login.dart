import 'package:provider/provider.dart';

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../provider/MainProvider.dart';
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
    // final main = Provider.of<MainProvider>(context, listen: false);
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
                  controller: _phone,
                  hint: 'Enter Your Mobile No.',
                  keyboard: TextInputType.phone,
                  onTap: () {
                    // _phone.text = '+91';
                  },
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
    if (_phone.text.isEmpty) {
      GlobalWidget.toast('Please enter a phone number');
      return;
    }
    final main = Provider.of<MainProvider>(context, listen: false);
    main.phoneAuth(context, _phone.text);
  }
}
