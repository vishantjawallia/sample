// ignore_for_file: nullable_type_in_catch_clause, unused_local_variable, camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore fire = FirebaseFirestore.instance;

class apiRepository {
  /* -------------------------------- @Get Request ------------------------------- */
  static Future getRequest(String? url) async {
    try {
      final response = await http.get(
        Uri.parse(url!),
        headers: {'Content-Type': "application/json"},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        log(response.statusCode.toString());
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }

  /* -------------------------------- @Post Request ------------------------------- */
  static Future postRequest(String? url, Map? data) async {
    try {
      final response = await http.post(
        Uri.parse(url!),
        body: jsonEncode(data),
        headers: {'Content-Type': "application/json"},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        log(response.statusCode.toString());
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }
}
