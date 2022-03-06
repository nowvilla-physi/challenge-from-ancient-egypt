import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    required this.action,
    required this.backgroundColor,
    required this.name,
    required this.textColor,
    required this.width,
  }) : super(key: key);
  final Function action;
  final Color backgroundColor;
  final String name;
  final Color textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: size.height * 0.05,
      child: ElevatedButton(
        child: Text(
          name,
          style: TextStyle(fontSize: 16.sp),
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: textColor,
          shape: const StadiumBorder(),
          elevation: Dimens.elevation,
        ),
        onPressed: () => action(context),
      ),
    );
  }
}
