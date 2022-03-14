import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../importer.dart';

final appViewModelNotifierProvider = ChangeNotifierProvider(
    (ref) => AppViewModel(appRepository: ref.read(appRepositoryProvider)));

class AppViewModel extends ChangeNotifier {
  AppViewModel({required AppRepository appRepository})
      : _appRepository = appRepository;

  final AppRepository _appRepository;

  List<MysteryItem> _items = [];

  List<MysteryItem> get items => _items;

  int? _clearedCount;

  int? get clearedCount => _clearedCount;

  Future<void> fetchMysteryItems() async {
    return _appRepository
        .getMysteryItems()
        .then((value) {
          _items = value;
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }

  Future<void> fetchClearedCount() async {
    return _appRepository.getClearedCount().then((value) {
      _clearedCount = value;
    }).catchError((dynamic error) {
      _clearedCount = 0;
    }).whenComplete(() => notifyListeners());
  }

  Future<void> saveItem(int id) async {
    final targetItem = _items.firstWhere((item) => item.id == id);
    final newItem = MysteryItem(
      id: id,
      kind: targetItem.kind,
      isResolved: true,
      imagePath: targetItem.imagePath,
      hint: targetItem.hint,
    );
    final newsItems =
        _items.map((value) => value.id == id ? newItem : value).toList();
    _appRepository.saveItem(newsItems);
    _items = newsItems;
    notifyListeners();
  }

  Future<void> saveClearCount() async {
    return _appRepository.saveClearedCount();
  }

  Future<bool?> isDisplayLastMystery() async {
    return _appRepository.isDisplayLastMystery();
  }

  Future<void> saveIsDisplayLastMystery() async {
    return _appRepository.saveIsDisplayLastMystery();
  }
}
