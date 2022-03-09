import '../importer.dart';

abstract class AppRepository {
  Future<List<MysteryItem>> getMysteryItems();
  Future<int> getMClearedCount();
  Future<void> saveItem(List<MysteryItem> items);
}
