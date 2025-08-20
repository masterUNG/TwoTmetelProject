import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebview extends StatefulWidget {
  const ShowWebview({super.key});

  @override
  State<ShowWebview> createState() => _ShowWebviewState();
}

class _ShowWebviewState extends State<ShowWebview> {
  WebViewController? webViewController;

  String urlWeb = 'https://www.2sonline.net/';

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..loadRequest(Uri.parse(urlWeb));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body:  WebViewWidget(controller: webViewController!),);
  }
}
