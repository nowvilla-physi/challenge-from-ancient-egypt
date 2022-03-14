import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class Mystery extends StatefulWidget {
  const Mystery({
    Key? key,
    required this.item,
  }) : super(key: key);
  final MysteryItem item;

  @override
  State<Mystery> createState() => _MysteryState();
}

class _MysteryState extends State<Mystery> {
  void _checkHint() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(Strings.hintCheckTitle),
          actions: <Widget>[
            TextButton(
              child: const Text(Strings.yesButton),
              onPressed: () {
                _dismiss();
                _showHint();
              },
            ),
            TextButton(
              child: const Text(Strings.noButton),
              onPressed: () => _dismiss(),
            ),
          ],
        );
      },
    );
  }

  void _showHint() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(Strings.hintTitle),
          content: Text(widget.item.hint),
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

  void _dismiss() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 32.h),
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: size.width,
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0.0, -12.0, 0.0),
                          width: size.width,
                          height: 24.h,
                          decoration: const BoxDecoration(
                            color: AppColors.baseColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Answer(id: item.id),
                            SizedBox(
                              height: 16.h,
                            ),
                            FloatingActionButton(
                              child: const Icon(Icons.lightbulb),
                              backgroundColor: AppColors.mainColor,
                              onPressed: () => _checkHint(),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 32.h),
                              child: const AppBackButton(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
