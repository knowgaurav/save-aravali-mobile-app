import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
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

class _EventPageState extends State<EventPage> {
  late WebViewController controller;
  bool isLoading = true;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                  initialUrl: 'https://savearavali.gauravsingh.live/events/',
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onPageFinished: (finish) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url
                        .startsWith("https://savearavali.gauravsingh.live")) {
                      return NavigationDecision.navigate;
                    } else {
                      _launchURL(request.url);
                      return NavigationDecision.prevent;
                    }
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

      // WebView(
      //     javascriptMode: JavascriptMode.unrestricted,
      //     initialUrl: '#',
      //     onWebViewCreated: (controller) {
      //       this.controller = controller;
      //     },
      //     onPageFinished: (url) {
      //       // controller.runJavascript(
      //       // "document.getElementsByTagName('header')[3].style.display='none'");
      //       // controller.runJavascript(
      //       //     "document.getElementsByClassName('elementor-section-wrap')[0].style.height='10px'");
      //       controller.runJavascript(
      //           "document.getElementsByTagName('footer')[0].style.display='none'");
      //     }),
    );
  }
}
