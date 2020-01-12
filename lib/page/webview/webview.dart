import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class WebView extends StatefulWidget {
  _WebViewState createState () => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(
        child: new WebviewScaffold(
            url: "https://mviptest.ilaisa.com/",
            withLocalStorage: true,
            clearCache: false,
            withZoom: true,
            withJavascript: true,
            withOverviewMode: true,
            geolocationEnabled: true,
            appBar: AppBar(
              title: Text("webviews") ,
            ),


        ),
      ),
    );
  }
}