import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

bool connectionStatus = true;

Future check() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connectionStatus = true;
      print("connected $connectionStatus");
    }
  } on SocketException catch (_) {
    connectionStatus = false;
    print("not connected $connectionStatus");
  }
}

class _AboutPageState extends State<AboutPage> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("WebView"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: FutureBuilder(
          future: check(), // a previously-obtained Future or null
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (connectionStatus == true) {
              //if Internet is connected
              return Stack(children: <Widget>[
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://savearavali.gauravsingh.live',
                  onPageFinished: (finish) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      )
                    : Stack(),
              ]);
            } else {
              //If internet is not connected
              return SafeArea(
                  child: WebviewScaffold(
                      url: Uri.dataFromString(
                              '<html><body style="background-color: orangered; color: white"><center><h1 style="margin-top: 50px">Offline</h1><h3>Please check your internet connection!</h3><center></body></html>',
                              mimeType: 'text/html')
                          .toString()));
            }
          }),
    );
  }

  // body: WebView(
  //   javascriptMode: JavascriptMode.unrestricted,
  //   initialUrl: 'https://savearavali.org/volunteer/',
  //   onWebViewCreated: (controller) {
  //     this.controller = controller;
  //   },
  //   onPageFinished: (url) {
  //     // controller.runJavascript(
  //     // "document.getElementsByTagName('header')[3].style.display='none'");
  //     // controller.runJavascript(
  //     //     "document.getElementsByClassName('elementor-section-wrap')[0].style.height='10px'");
  //     controller.runJavascript(
  //         "document.getElementsByTagName('footer')[0].style.display='none'");
  //   },
  // ),

  // Widget pageUI() {
  //   return Consumer<ConnectivityProvider>(builder: (context, model, child) {
  //     // if (model.isOnline != null) {
  //     //   return model.isOnline
  //     WebView(
  //         javascriptMode: JavascriptMode.unrestricted,
  //         initialUrl: 'https://savearavali.org',
  //         onWebViewCreated: (controller) {
  //           this.controller = controller;
  //         },
  //         onPageFinished: (url) {});
  //     //       : NoInternet();
  //     // }

  //     return Container(
  //       child: Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     );
  //   });
  // }
}
