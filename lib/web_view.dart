import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String webView;
  const WebViewPage({super.key, required this.webView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'RecipeView Details',
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: WebView(
        initialUrl: webView,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
