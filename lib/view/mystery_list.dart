import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class MysteryList extends ConsumerWidget {
  const MysteryList({Key? key, required this.kind}) : super(key: key);
  final String kind;
  final prefix = 'assets/images/mystery';

  List<String> _createImagePaths(MysteryKind kind) {
    switch (kind) {
      case MysteryKind.bird:
        return [
          '${prefix}1.png',
          '${prefix}2.png',
          '${prefix}3.png',
        ];
      case MysteryKind.animal:
        return [
          '${prefix}4.png',
          '${prefix}5.png',
          '${prefix}6.png',
        ];
      case MysteryKind.human:
        return [
          '${prefix}7.png',
          '${prefix}8.png',
          '${prefix}9.png',
        ];
      default:
        return [''];
    }
  }

  List<MysteryItem> _createMysteryItems(
      MysteryKind mysteryKind, WidgetRef ref) {
    final items = ref.watch(appViewModelNotifierProvider).items;
    return items
        .where((item) => MysteryKindExtension.of(item.kind) == mysteryKind)
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mysteryKind = MysteryKindExtension.of(kind)!;
    final items = _createMysteryItems(mysteryKind, ref);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 64.h, bottom: 48.h),
          child: Column(
            children: <Widget>[
              Text(
                Strings.resolveMysteryMsg,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: AppColors.white,
                ),
              ),
              ImageButton(
                item: items[0],
                imagePath: _createImagePaths(mysteryKind)[0],
              ),
              ImageButton(
                item: items[1],
                imagePath: _createImagePaths(mysteryKind)[1],
              ),
              ImageButton(
                item: items[2],
                imagePath: _createImagePaths(mysteryKind)[2],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16.h,
                ),
                child: const AppBackButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
