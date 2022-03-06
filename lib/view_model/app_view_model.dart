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

  Future<void> fetchMysteryItems() async {
    return _appRepository
        .getMysteryItems()
        .then((value) {
          _items = value;
        })
        .catchError((dynamic error) {})
        .whenComplete(() => notifyListeners());
  }
}
