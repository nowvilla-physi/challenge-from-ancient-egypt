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

  final snackBar = SnackBar(
    backgroundColor: AppColors.red,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Strings.emptyAlertMsg,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18.sp,
          ),
        ),
      ],
    ),
  );

  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    answer = dotenv.get('ANSWER${widget.id}');
  }

  void _check() {
    if (_input.trim().isEmpty) {
      _clearEmptyAlert();
      _showEmptyAlert();
    } else {
      _toJudgement();
    }
  }

  void _showEmptyAlert() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _clearEmptyAlert() {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  void _toJudgement() {
    var isCorrect = false;
    if (_input.compareTo(answer) == 0) {
      isCorrect = true;
    }
    Navigator.of(context).pushNamed(
      Strings.judgementPath,
      arguments: isCorrect,
    );
    setState(() {
      _input = "";
      _textEditingController.clear();
    });
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
              controller: _textEditingController,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.sp,
              ),
              onChanged: (value) {
                setState(() {
                  _input = value;
                });
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.green,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green,
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
