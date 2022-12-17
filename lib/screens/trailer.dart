import 'dart:convert';
import 'dart:io';

import 'package:motchill/models/video_model.dart';

import 'package:webview_flutter/webview_flutter.dart';
import "package:flutter/material.dart";

class WebViewVideo extends StatefulWidget {
  const WebViewVideo({super.key});
  final String routerName = "/trailer";

  @override
  WebViewVideoState createState() => WebViewVideoState();
}

class WebViewVideoState extends State<WebViewVideo> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    // Enable virtual display.

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    print(arg);
    // ignore: unrelated_type_equality_checks
    final List<Video> video = arg.containsKey("video") ? arg["video"] : [];
    print(arg.containsKey("category"));
    final String id = arg["id"];
    final String category =arg.containsKey("category") ? arg["category"] : "trailer";
    final String action = arg["action"];

    String html() {
      return '''
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <style>
        *{
            padding: 0;
            margin: 0 ; 
            box-sizing: border-box;
           
        }
        body {
            max-width: 1440px;
            width: 100%;
            height: 99.9vh;
            background-color: black;
        }
        .video_view{
         max-width: 1440px;
         width: 100%;
         max-height: 99.6vh;
        height: 100%;
        }
    </style>
    <body>

        <html>
            <body>
                <iframe class="video_view"
                    src=${action == "watch_now" ? 
                    "https://2embed.org/embed/${category}?tmdb=${id}" : 
                    "https://www.youtube-nocookie.com/embed/${video[0].key}"}
                     frameborder="0" 
                     allowfullscreen="allowfullscreen">
                </iframe>
            </body>
        </html>
    </body>
</html>

<script >
  alert("  ${action}") ;
</script>
''';
    }

    void localHTML() async {
      final url = Uri.dataFromString(
        html(),
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString();
      controller.loadUrl(url);
    }

    if (video.isEmpty&& action =="trailer")  {
      return Scaffold(
        body: Text("Loadind...", style: TextStyle(color: Colors.white)),
      );
    }
    return Scaffold(
        body: Container(
      width: 1500,
      height: 16001,
      color: Colors.red,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          this.controller = controller;

          localHTML();
        },
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.prevent;
        },
      ),
    ));
  }
}
