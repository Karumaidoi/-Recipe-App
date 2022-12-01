import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String webView;
  const WebViewPage({super.key, required this.webView});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  double loadingPercentage = 0;
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
        initialUrl: widget.webView,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress.toDouble();
          });
        },
      ),
    );
  }
}
