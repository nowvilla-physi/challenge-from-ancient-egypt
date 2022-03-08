import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../importer.dart';

class KeyList extends StatefulWidget {
  const KeyList({Key? key}) : super(key: key);

  @override
  State<KeyList> createState() => _KeyListState();
}

class _KeyListState extends State<KeyList> {
  int _currentPosition = 0;
  final _initialKeyList = [
    {
      'title': 'File.1',
      'kind': 'bird',
      'imagePath': 'assets/images/ic_key_bird.png',
    },
    {
      'title': 'File.2',
      'kind': 'animal',
      'imagePath': 'assets/images/ic_key_animal.png',
    },
    {
      'title': 'File.3',
      'kind': 'human',
      'imagePath': 'assets/images/ic_key_human.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: Dimens.verticalPadding.h),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: size.height * 0.6,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentPosition = index;
                    });
                  },
                ),
                items: _initialKeyList.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        child: KeyItem(
                          imagePath: item['imagePath']!,
                          kind: item['kind']!,
                          title: item['title']!,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _initialKeyList.asMap().entries.map((entry) {
                return GestureDetector(
                  child: Container(
                    width: Dimens.dotWidth.w,
                    height: Dimens.dotHeight.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withOpacity(
                        _currentPosition == entry.key ? 1.0 : 0.5,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 48.h),
              child: const AppBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
