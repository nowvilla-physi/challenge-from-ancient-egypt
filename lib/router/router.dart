import 'package:challenge_from_ancient_egypt/view/key_list.dart';
import 'package:flutter/material.dart';
import '../importer.dart';

class AppRouter {
  MaterialPageRoute? createGenerateRoute(RouteSettings settings) {
    if (settings.name == Strings.keyListPath) {
      // final args = settings.arguments as MoviePlayerArguments;
      return MaterialPageRoute(
        builder: (context) {
          return const KeyList(key: Key(Strings.keyListPath));
        },
      );
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
