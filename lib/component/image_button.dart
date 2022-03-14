import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class ImageButton extends StatefulWidget {
  const ImageButton({
    Key? key,
    required this.imagePath,
    required this.item,
  }) : super(key: key);
  final String imagePath;
  final MysteryItem item;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  void _toMystery(BuildContext context) {
    Navigator.of(context).pushNamed(
      Strings.mysteryPath,
      arguments: widget.item,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _isResolved = widget.item.isResolved;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 16.h),
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                child: SelectButton(
                  textColor: _isResolved ? AppColors.green : AppColors.mainColor,
                  backgroundColor: AppColors.white,
                  action: _toMystery,
                  name: _isResolved ? Strings.clearButton : Strings.releaseButton,
                  width: size.width * 0.4,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
