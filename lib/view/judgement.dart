import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class Judgement extends ConsumerStatefulWidget {
  const Judgement({Key? key, required this.isCorrect}) : super(key: key);
  final bool isCorrect;

  @override
  ConsumerState<Judgement> createState() => _JudgementState();
}

class _JudgementState extends ConsumerState<Judgement> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final items = ref.watch(appViewModelNotifierProvider).items;
      final isAllResolved = items.every((item) => item.isResolved == true);
      if (isAllResolved) {
        ref.watch(appViewModelNotifierProvider).saveClearCount();
      }

      final itemsExceptLastItem = items.sublist(0, items.length - 1);
      final isResolved =
          itemsExceptLastItem.every((item) => item.isResolved == true);
      if (isResolved) {
        final isDisplayLastMystery = await ref
            .watch(appViewModelNotifierProvider)
            .isDisplayLastMystery();
        if (isDisplayLastMystery == null) {
          ref.watch(appViewModelNotifierProvider).saveIsDisplayLastMystery();
          _showNotifier();
        }
      }
    });
  }

  void _showNotifier() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(Strings.lastTitle),
          content: const Text(Strings.lastMsg),
          actions: <Widget>[
            TextButton(
              child: const Text(Strings.closeButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageFile = widget.isCorrect ? "ic_correct.png" : "ic_incorrect.png";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    widget.isCorrect
                        ? Strings.successfulDecodingMsg
                        : Strings.decodingFailureMsg,
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: widget.isCorrect ? AppColors.green : AppColors.red,
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
                    widget.isCorrect
                        ? Strings.correctMsg
                        : Strings.incorrectMsg,
                    style: TextStyle(fontSize: 20.sp, color: AppColors.white),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.isCorrect
                        ? Strings.congratulationMsg
                        : Strings.hintMsg,
                    style: TextStyle(fontSize: 20.sp, color: AppColors.white),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.isCorrect ? Strings.nextMsg : Strings.rethinkMsg,
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
      ),
    );
  }
}
