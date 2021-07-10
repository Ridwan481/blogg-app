import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collectin) async {
    final firestore =
        Firestore.instance.collection(collectin).where('title').snapshots();
    return firestore;
  }

  Future querysnapshort(String query, QuerySnapshot snapshot) async {
    return Firestore.instance
        .collection("entercool")
        .where('title', isGreaterThanOrEqualTo: query)
        .snapshots();
  }
}
