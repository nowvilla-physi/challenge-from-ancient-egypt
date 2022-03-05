import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer timer;
  final duration = 2;
  var _isTransparent = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: duration), (timer) {
      _updateTransparent();
    });
  }

  void _updateTransparent() {
    setState(() {
      _isTransparent = !_isTransparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home-background.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.06,
                child: ElevatedButton(
                  child: Text(
                    Strings.startButton,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.mainColor,
                    onPrimary: AppColors.black,
                    shape: const StadiumBorder(),
                    elevation: Dimens.elevation,
                  ),
                  onPressed: () {
                    print("###");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: Duration(seconds: duration),
                opacity: _isTransparent ? 0.0 : 1.0,
                child: Container(
                  width: 42.w,
                  height: 50.h,
                  margin: EdgeInsets.only(
                    top: 40.h,
                    left: 216.w,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ic_finger.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
