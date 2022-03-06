import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'importer.dart';

// This widget is the root of your application.
class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);
  final router = AppRouter();

  Future<void> _loadMysteryItems(WidgetRef ref) async {
    await ref.watch(appViewModelNotifierProvider).fetchMysteryItems();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(appViewModelNotifierProvider).items;
    if (items.isEmpty) {
      _loadMysteryItems(ref);
    }

    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.baseColor,
        ),
        scaffoldBackgroundColor: AppColors.baseColor,
      ),
      home: ScreenUtilInit(
        // デザイン原案におけるデバイス画面の大きさ(単位：dp)
        designSize: const Size(360, 690),
        builder: () => const Home(title: Strings.appTitle),
      ),
      onGenerateRoute: (RouteSettings settings) =>
          router.createGenerateRoute(settings),
    );
  }
}
