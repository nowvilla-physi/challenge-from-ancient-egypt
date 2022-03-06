import '../importer.dart';

abstract class AppRepository {
  Future<List<MysteryItem>> getMysteryItems();
}
