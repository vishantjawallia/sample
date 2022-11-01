// ignore_for_file: nullable_type_in_catch_clause, unused_local_variable, camel_case_types

import 'dart:developer';
import 'dart:io';

import 'package:sample/api/apiRepository.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;
// final FirebaseFirestore fire = FirebaseFirestore.instance;

class firestoreRepository {
  /* --------------------------------- @Create  -------------------------------- */
  static apiRead(String path) async {
    try {
      final response = await fire.doc(path).get();
      if (response.exists) {
        return response.id;
      } else {
        log("@Read Data  Error: id :${response.reference}");
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }

  /* --------------------------------- @Create  -------------------------------- */
  static apiCreate(Map data, String path) async {
    try {
      Map<String, dynamic> create = {
        ...data,
        "created_at": DateTime.now(),
      };
      if (path.contains('/')) {
        final response = await fire.doc(path).set(create);
        return auth.currentUser!.uid;
      } else {
        final response = await fire.collection(path).add(create);
        if (response.id.isNotEmpty) {
          return response.id;
        } else {
          log("@Create Data Add Error: id :${response.id}");
          return;
        }
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
