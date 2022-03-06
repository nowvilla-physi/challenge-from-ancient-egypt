import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class Answer extends StatefulWidget {
  const Answer({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  late String answer;
  String _input = "";

  @override
  void initState() {
    super.initState();
    answer = dotenv.get('ANSWER${widget.id}');
  }

  void _check() {
    print("check");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: size.width * 0.4,
            child: TextFormField(
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.sp,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.green,
                    width: 2.0,
                  ),
                ),
                labelText: Strings.inputLabel,
                labelStyle: const TextStyle(
                  color: AppColors.green,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: AppColors.green,
            onPressed: () => _check(),
          ),
        ],
      ),
    );
  }
}
