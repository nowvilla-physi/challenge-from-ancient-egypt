import 'package:flutter/material.dart';
import '../importer.dart';

class AppRouter {
  MaterialPageRoute? createGenerateRoute(RouteSettings settings) {
    if (settings.name == Strings.keyListPath) {
      return MaterialPageRoute(
        builder: (context) {
          return const KeyList(key: Key(Strings.keyListPath));
        },
      );
    } else if (settings.name == Strings.mysteryListPath) {
      final args = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) {
          return MysteryList(
            key: const Key(Strings.mysteryListPath),
            kind: args,
          );
        },
      );
    } else if (settings.name == Strings.mysteryPath) {
      final args = settings.arguments as MysteryItem;
      return MaterialPageRoute(
        builder: (context) {
          return Mystery(
            key: const Key(Strings.mysteryPath),
            item: args,
          );
        },
      );
    } else if (settings.name == Strings.judgementPath) {
      final args = settings.arguments as bool;
      return MaterialPageRoute(
        builder: (context) {
          return Judgement(
            key: const Key(Strings.judgementPath),
            isCorrect: args,
          );
        },
      );
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
