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
  }) : super(key: key);
  final Function action;
  final Color backgroundColor;
  final String name;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: ElevatedButton(
        child: Text(
          Strings.startButton,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: textColor,
          shape: const StadiumBorder(),
          elevation: Dimens.elevation,
        ),
        onPressed: () => action(),
      ),
    );
  }
}
