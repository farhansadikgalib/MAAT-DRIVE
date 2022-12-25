import 'package:flutter/material.dart';
import '../widgets/load_web_view.dart';

class HomeScreen extends StatefulWidget {
  final String url;
  final bool mainPage;
  final bool isDeepLink;
  final Function? callback;
  const HomeScreen(this.url, this.mainPage, this.isDeepLink,
      {Key? key, this.callback})
      : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen>, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late AnimationController navigationContainerAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    navigationContainerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).cardColor,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: LoadWebView(
            url: widget.url,
            webUrl: true,
            isDeepLink: false,
            isMainPage: widget.mainPage,
          ),
        )
        );

  }

}
