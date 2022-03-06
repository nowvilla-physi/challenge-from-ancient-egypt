import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class ImageButton extends StatefulWidget {
  const ImageButton({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  final bool _isResolved = false;
  void tap(BuildContext context) {
    print("!");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 16.h),
      child: Stack(
        children: <Widget>[
          Image.asset(widget.imagePath),
          Container(
            margin: EdgeInsets.only(top: 184.h),
            alignment: Alignment.center,
            child: SelectButton(
              textColor: AppColors.shadow,
              backgroundColor: AppColors.white,
              action: tap,
              name: _isResolved ? Strings.clearButton : Strings.releaseButton,
              width: size.width * 0.4,
            ),
          )
        ],
      ),
    );
  }
}
