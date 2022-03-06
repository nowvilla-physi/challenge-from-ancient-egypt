import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class KeyItem extends StatelessWidget {
  const KeyItem({
    Key? key,
    required this.imagePath,
    required this.kind,
    required this.title,
  }) : super(key: key);
  final String imagePath;
  final String kind;
  final String title;

  void _toMysteryList(BuildContext context) {
    Navigator.of(context).pushNamed(
      Strings.mysteryListPath,
      arguments: kind,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: const [
        //   BoxShadow(
        //     color: AppColors.shadow,
        //     spreadRadius: 4,
        //     blurRadius: 8,
        //     offset: Offset(4, 4),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 40.sp,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.h),
              child: SizedBox(
                width: size.width * 0.6,
                child: Image.asset(imagePath),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.h),
              child: SelectButton(
                action: _toMysteryList,
                backgroundColor: AppColors.baseColor,
                name: Strings.resolveButton,
                textColor: AppColors.white,
                width: size.width * 0.8,
              ),
            )
          ],
        ),
      ),
    );
  }
}