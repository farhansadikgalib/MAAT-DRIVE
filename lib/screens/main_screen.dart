import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../helpers/Constant.dart';
import '../widgets/load_web_view.dart';

class MyHomePage extends StatefulWidget {
  final String webUrl;
  final bool isDeepLink;

  const MyHomePage({Key? key, required this.webUrl, required this.isDeepLink})
      : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 1;
  var _previousIndex;
  late AnimationController idleAnimation;
  late AnimationController onSelectedAnimation;
  late AnimationController onChangedAnimation;
  Duration animationDuration = const Duration(milliseconds: 700);
  late AnimationController navigationContainerAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    idleAnimation = AnimationController(vsync: this);
    onSelectedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
    onChangedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    idleAnimation.dispose();
    onSelectedAnimation.dispose();
    onChangedAnimation.dispose();
    navigationContainerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).cardColor,
      statusBarBrightness: Theme.of(context).brightness == Brightness.dark
          ? Brightness.dark
          : Brightness.light,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    ));
    return
     GestureDetector(
        child: SafeArea(
          top: Platform.isIOS ? false : true,
          child: Scaffold(
            extendBody: true,
            // extendBody: true,
            body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: LoadWebView(
          url: widget.webUrl,
          webUrl: true,
          isDeepLink: false, isMainPage:true,
        ),
      ),

    ),
        ),

    );
  }


}
