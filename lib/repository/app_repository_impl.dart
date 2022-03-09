import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../importer.dart';

class AppRepositoryImpl implements AppRepository {
  final _prefDataKey = 'DATA_KEY';
  final _prefClearKey = 'CLEAR_COUNT_KEY';
  final _dataKey = 'data';

  @override
  Future<List<MysteryItem>> getMysteryItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cache = prefs.getString(_prefDataKey);
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
  Future<int> getClearedCount() async {
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
    prefs.setString(_prefDataKey, jsonStr);
  }

  List<MysteryItem> _createMysteryItems(dynamic data) {
    return List<MysteryItem>.from(
      data.map((value) => MysteryItem.fromJson(value)).toList(),
    );
  }

  @override
  Future<void> saveClearedCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cache = prefs.getBool(_prefClearKey);
    if (cache == null) {
      final clearedCount = await getClearedCount();
      FirebaseFirestore.instance
          .collection('count')
          .doc('cleared')
          .update({'num': clearedCount + 1});
      prefs.setBool(_prefClearKey, true);
    }
  }
}
