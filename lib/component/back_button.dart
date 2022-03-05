import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    required this.action,
  }) : super(key: key);
  final Function action;

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
        onPressed: () => action(context),
      ),
    );
  }
}
