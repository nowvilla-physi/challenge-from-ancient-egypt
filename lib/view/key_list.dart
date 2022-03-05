import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class KeyList extends StatelessWidget {
  const KeyList({Key? key}) : super(key: key);

  void _toHome(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.verticalPadding.h,
          ),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(height: size.height * 0.5),
                items: [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: size.width,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48),
                child: AppBackButton(action: _toHome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
