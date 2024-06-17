import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const WebViewExample(),
      },
    ),
  );
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
        // Uri.parse('https://ecommerce-frontend-five-omega.vercel.app/'));
        Uri.parse('https://luxury-bunny-48df44.netlify.app/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
