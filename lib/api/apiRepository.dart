// ignore_for_file: nullable_type_in_catch_clause, unused_local_variable, camel_case_types

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore fire = FirebaseFirestore.instance;

// import 'package:seller_support/provider/MainProvider.dart';

class apiRepository {

  
  /* --------------------------------- @Create  -------------------------------- */
  static apiCreate(Map data, String collection) async {
    try {
      Map<String, dynamic> create = {
        ...data,
        "created_at": DateTime.now(),
      };
      final response = await fire.collection(collection).add(create);
      if (response.id.isNotEmpty) {
        return response.id;
      } else {
        log("@Create Data Add Error: id :${response.id}");
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }

  /* --------------------------------- @Update  -------------------------------- */
  static apiUpdate(String id, String collection, Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> update = {
        ...data,
        "updated_at": DateTime.now(),
      };
      final response = fire.collection(collection).doc(id);
      if (response.id.isNotEmpty) {
        await response.update(data);
        return response.id;
      } else {
        log("@Update ID Not Exist:${response.id}");
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }

  /* --------------------------------- @Delete  -------------------------------- */
  static apiDelete(String id, String collection) async {
    try {
      final response = fire.collection(collection).doc(id);
      if (response.id.isNotEmpty) {
        await response.delete();
        return response.id;
      } else {
        log("@Delete ID Not Exist:${response.id}");
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }
}
