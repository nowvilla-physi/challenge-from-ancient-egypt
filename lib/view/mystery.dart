import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class Mystery extends StatefulWidget {
  const Mystery({
    Key? key,
    required this.item,
  }) : super(key: key);
  final MysteryItem item;

  @override
  State<Mystery> createState() => _MysteryState();
}

class _MysteryState extends State<Mystery> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Image.asset(item.imagePath),
                  Answer(id: item.id),
                  Container(
                    margin: EdgeInsets.only(top: 48.h),
                    child: const AppBackButton(),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20.w,
              bottom: 92.h,
              child: FloatingActionButton(
                child: const Icon(Icons.lightbulb),
                backgroundColor: AppColors.mainColor,
                onPressed: () { print("ssss");},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
