import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/src/provider.dart';
import '../helpers/Strings.dart';

class NotFound extends StatefulWidget {
  InAppWebViewController _webViewController;
  String url;
  String title1;
  String title2;
  NotFound(this._webViewController, this.url, this.title1, this.title2);

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            CustomStrings.pageNotFound1,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            CustomStrings.pageNotFound2,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          _isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )
              : TextButton(
                  child: const Text('Retry'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Theme.of(context).cardColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });

                    Future.delayed(const Duration(seconds: 3), () {
                      widget._webViewController.loadUrl(
                          urlRequest: URLRequest(url: Uri.parse(widget.url)));
                      setState(() {
                        _isLoading = false;
                      });
                    });
                  },
                ),
        ],
      ),
    );
  }
}
