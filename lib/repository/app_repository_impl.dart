import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../importer.dart';

class AppRepositoryImpl implements AppRepository {
  final _key = 'DATA_KEY';
  final _dataKey = 'data';

  @override
  Future<List<MysteryItem>> getMysteryItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cache = prefs.getString(_key);
    dynamic data;
    if (cache == null) {
      String jsonStr = await rootBundle.loadString('assets/json/data.json');
      data = json.decode(jsonStr)[_dataKey];
    } else {
      data = json.decode(cache)[_dataKey];
    }
    print('data: $data');
    return _createMysteryItems(data);
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

  @override
  Future<void> saveItem(List<MysteryItem> items) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final jsonStr = json.encode({_dataKey: items});
      prefs.setString(_key, jsonStr);
  }

  List<MysteryItem> _createMysteryItems(dynamic data) {
    return List<MysteryItem>.from(
      data.map((value) => MysteryItem.fromJson(value)).toList(),
    );
  }
}
