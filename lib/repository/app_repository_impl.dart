import 'dart:convert';
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
}
