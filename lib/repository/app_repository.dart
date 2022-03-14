import '../importer.dart';

abstract class AppRepository {
  Future<List<MysteryItem>> getMysteryItems();

  Future<int> getClearedCount();

  Future<void> saveItem(List<MysteryItem> items);

  Future<void> saveClearedCount();

  Future<bool?> isDisplayLastMystery();

  Future<void> saveIsDisplayLastMystery();
}
