import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  HomeScreen({super.key});
  final String url = 'https://blog.codefactory.ai';
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(

          appBar: AppBar(title: const Text('CodeFactory'), centerTitle: true, backgroundColor: Colors.green, actions: [
            IconButton(onPressed: (){
              if(controller != null) {
                controller!.loadUrl(url);
              }
            }, icon: const Icon(Icons.home))
          ],),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller){
          this.controller = controller;
        },
      ),
    );

  }
}
