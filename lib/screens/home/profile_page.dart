// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sample/api/firestoreRepository.dart';
import 'package:sample/widgets/GlobalWidget.dart';

import '../../config/MyImages.dart';
import '../../config/Palettes.dart';
import '../../provider/MainProvider.dart';
import '../../widgets/CustomProgress.dart';
import '../../widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fire = FirebaseFirestore.instance;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 14.sp),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Edit Profile'),
            GestureDetector(
              onTap: () => Provider.of<MainProvider>(context, listen: false).signOut(context),
              child: Row(
                children: const [
                  Text('Logout'),
                  SizedBox(width: 6),
                  Icon(Icons.power_settings_new, color: Palettes.white),
                ],
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: fire.doc('users/${auth.currentUser!.uid}').snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          bool? loading = true;
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            if (snapshot.data!.exists) {
              loading = false;
              _name.text = data!['name'];
              _email.text = data['email'];
              _phone.text = data['phone'];
            }
          }
          return CustomProgress(
            load: context.watch<MainProvider>().loading,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
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
                        controller: _name,
                        hint: 'Name',
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
                        controller: _phone,
                        readOnly: true,
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
          );
        },
      ),
    );
  }

  /* ----------------------------- Submit Handler ----------------------------- */
  void submitHandler() async {
    final main = Provider.of<MainProvider>(context, listen: false);
    main.loading = true;
    Map<String, dynamic> data = {
      "name": _name.text,
      "email": _email.text,
    };
    if (data.containsValue('')) {
      GlobalWidget.toast('Please enter valid name and email');
      return;
    }
    final res = await firestoreRepository.apiUpdate(auth.currentUser!.uid, 'users', data);
    if (res != null) {
      GlobalWidget.toast('Profile updated successfully');
      main.loading = false;
    }
  }
}
