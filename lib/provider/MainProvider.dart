// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/api/firestoreRepository.dart';
import 'package:sample/widgets/GlobalWidget.dart';
import '/screens/auth/otp.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore fire = FirebaseFirestore.instance;

class MainProvider extends ChangeNotifier {
  bool loading = false;

  /* ------------------------------- @Auth Login OTP------------------------------ */
  void phoneAuth(BuildContext context, String phone) async {
    loading = true;
    // notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        auth.signInWithCredential(phoneAuthCredential).then((value) async {
          if (value.user != null) {
            final res = await firestoreRepository.apiRead('users/${value.user!.uid}');
            loading = false;
            // notifyListeners();
            if (res != null) {
              if (res['id'] == value.user!.uid) {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              } else {
                signOut(context);
              }
            } else {
              Navigator.popAndPushNamed(context, '/register');
            }
          }
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        loading = false;
        // notifyListeners();
        if (error.code == 'invalid-phone-number') {
          GlobalWidget.toast('Invalid phone number');
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        loading = false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Otp(phone, verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
    notifyListeners();
  }

  /* ------------------------------- @OTP Verify ------------------------------ */
  void otpVerify(BuildContext context, String id, String otp) async {
    loading = true;
    try {
      await auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: id, smsCode: otp)).then((value) async {
        if (value.user != null) {
          final res = await firestoreRepository.apiRead('users/${value.user!.uid}');
          loading = false;
          if (res != null) {
            if (res['id'] == value.user!.uid) {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            } else {
              signOut(context);
            }
          } else {
            Navigator.popAndPushNamed(context, '/register');
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        loading = false;
      }
    } finally {
      loading = false;
    }
    notifyListeners();
  }

  /* ------------------------------- @Logout ------------------------------ */
  void signOut(BuildContext context) async {
    await auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
