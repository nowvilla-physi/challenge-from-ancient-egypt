import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class MysteryList extends StatefulWidget {
  const MysteryList({Key? key, required this.kind}) : super(key: key);
  final String kind;

  @override
  State<MysteryList> createState() => _MysteryListState();
}

class _MysteryListState extends State<MysteryList> {
  MysteryKind? kind;

  @override
  void initState() {
    super.initState();
    kind = MysteryKindExtension.of(widget.kind);
  }

  List<String> _createImagePaths(MysteryKind kind) {
    switch (kind) {
      case MysteryKind.bird:
        return [
          "assets/images/mystery1.png",
          "assets/images/mystery2.png",
          "assets/images/mystery3.png",
        ];
      case MysteryKind.animal:
        return [
          "assets/images/mystery4.png",
          "assets/images/mystery5.png",
          "assets/images/mystery6.png",
        ];
      case MysteryKind.human:
        return [
          "assets/images/mystery7.png",
          "assets/images/mystery8.png",
          "assets/images/mystery9.png",
        ];
      default:
        return [""];
    }
  }

  void tap() {
    print("###");
  }

  @override
  Widget build(BuildContext context) {
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
                imagePath: _createImagePaths(kind!)[0],
              ),
              ImageButton(
                imagePath: _createImagePaths(kind!)[1],
              ),
              ImageButton(
                imagePath: _createImagePaths(kind!)[2],
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
