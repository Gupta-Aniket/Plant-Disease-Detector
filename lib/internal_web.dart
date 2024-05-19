import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InternalWeb extends StatefulWidget {
  final String redirectTo;
  InternalWeb({super.key, required this.redirectTo});

  @override
  State<InternalWeb> createState() => _InternalWebState();
}

class _InternalWebState extends State<InternalWeb> {
  late WebViewController controller;
  // this has to be late to signify that this will come on later.
  @override
  void initState() {
    // TODO: implement initState
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.redirectTo));
    super.initState();
  }
  // this has to be done on initState to make sure that we have all the things before actually using it.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internal Web',
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
