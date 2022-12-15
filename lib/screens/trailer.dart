import 'dart:convert';
import 'dart:io';

import 'package:motchill/models/video_model.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import "package:flutter/material.dart";

import '../models/movie_model.dart';
import '../providers/movies_provider.dart';

class WebViewVideo extends StatefulWidget {
  const WebViewVideo({super.key});
  final String routerName = "/trailer" ; 
  
  @override
  WebViewVideoState createState() => WebViewVideoState();
}

class WebViewVideoState extends State<WebViewVideo> {
  late WebViewController controller;
  


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

  });
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final List<Video> video = ModalRoute.of(context)!.settings.arguments as List<Video>;
    if(video.isEmpty) {
      return Scaffold(
        body: Text("Loadind...", style: TextStyle(color: Colors.white)),
      );
    }
        String html( video) {
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
                    src="https://www.youtube-nocookie.com/embed/${video.key}"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write;
                    encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
             
            </body>
        </html>
    </body>
</html>
''' ;
  }
  void localHTML( key_sort) async {
    final url = Uri.dataFromString(
      html(key_sort),
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    controller.loadUrl(url);
  }

    return Scaffold(
        appBar: AppBar(
          title: Text("${video[0].name}"),
        ),
        body: Container(
          width: 1500,
          height: 16001,
          color: Colors.red,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
             
                  localHTML(video[0]);
           
             
            },
          ),
        ));
  }

}
