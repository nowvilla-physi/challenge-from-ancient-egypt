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
    else if (settings.name == Strings.mysteryListPath) {
      // final args = settings.arguments as MoviePlayerArguments;
      return MaterialPageRoute(
        builder: (context) {
          return const MysteryList(key: Key(Strings.mysteryListPath));
        },
      );
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
