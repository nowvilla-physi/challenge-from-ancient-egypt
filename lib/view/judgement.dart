import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class Judgement extends StatelessWidget {
  const Judgement({Key? key, required this.isCorrect}) : super(key: key);
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final imageFile = isCorrect ? "ic_correct.png" : "ic_incorrect.png";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  isCorrect
                      ? Strings.successfulDecodingMsg
                      : Strings.decodingFailureMsg,
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: isCorrect ? AppColors.green : AppColors.red,
                  ),
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: 216.w,
                  height: 216.h,
                  child: Image.asset('assets/images/$imageFile'),
                ),
                SizedBox(height: 48.h),
                Text(
                  isCorrect ? Strings.correctMsg : Strings.incorrectMsg,
                  style: TextStyle(fontSize: 20.sp, color: AppColors.white),
                ),
                SizedBox(height: 8.h),
                Text(
                  isCorrect ? Strings.congratulationMsg : Strings.hintMsg,
                  style: TextStyle(fontSize: 20.sp, color: AppColors.white),
                ),
                SizedBox(height: 8.h),
                Text(
                  isCorrect ? Strings.nextMsg : Strings.rethinkMsg,
                  style: TextStyle(fontSize: 20.sp, color: AppColors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 48.h),
                  child: const AppBackButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
