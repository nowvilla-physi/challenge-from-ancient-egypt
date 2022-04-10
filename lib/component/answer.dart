import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import '../importer.dart';

class Answer extends ConsumerStatefulWidget {
  const Answer({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  ConsumerState<Answer> createState() => _AnswerState();
}

class _AnswerState extends ConsumerState<Answer> {
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return dotenv.get("ADMOB_ANDROID_INTERSTITIAL_ID");
    } else {
      return dotenv.get("ADMOB_IOS_INTERSTITIAL_ID");
    }
  }

  static const int maxFailedLoadAttempts = 3;
  late String answer;
  String _input = "";
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  @override
  void initState() {
    super.initState();
    answer = dotenv.get('ANSWER${widget.id}');
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('Interstitial ad loaded.');
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

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

  void _check() async {
    if (_input.trim().isEmpty) {
      _clearEmptyAlert();
      _showEmptyAlert();
    } else {
      _showInterstitialAd();
      _toJudgement();
    }
  }

  void _showEmptyAlert() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _clearEmptyAlert() {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  void _toJudgement() async {
    var isCorrect = false;
    if (_input.compareTo(answer) == 0) {
      isCorrect = true;
      await _save();
    }
    Navigator.of(context).pushNamed(
      Strings.judgementPath,
      arguments: isCorrect,
    );
    setState(() {
      _input = "";
      _textEditingController.clear();
    });
    _doUnFocus();
  }

  void _doUnFocus() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> _save() async {
    await ref.watch(appViewModelNotifierProvider).saveItem(widget.id);
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

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }
}
