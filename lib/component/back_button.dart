import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      child: ElevatedButton(
        child: Text(
          Strings.backButton,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.white,
          onPrimary: AppColors.black,
          shape: const StadiumBorder(),
          elevation: Dimens.elevation,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
