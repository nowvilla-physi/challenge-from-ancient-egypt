import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../importer.dart';

final appRepositoryProvider =
    Provider<AppRepository>((ref) => AppRepositoryImpl());
