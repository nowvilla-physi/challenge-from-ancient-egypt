import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../importer.dart';

class AppRepositoryImpl implements AppRepository {
  @override
  Future<List<MysteryItem>> getMysteryItems() async {
    String jsonStr = await rootBundle.loadString("assets/json/data.json");
    final data = json.decode(jsonStr)["data"];
    return List<MysteryItem>.from(
      data.map((value) => MysteryItem.fromJson(value)).toList(),
    );
  }

  @override
  Future<int> getMClearedCount() async {
    return FirebaseFirestore.instance
        .collection('count')
        .doc('cleared')
        .get()
        .then(
          (ref) => ref.get('num'),
        );
  }
}
