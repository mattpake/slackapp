import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:slackapp/controller/get_token.dart';
import 'package:slackapp/screens/home_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SlackAuthScreen extends StatefulWidget {
  const SlackAuthScreen({Key? key}) : super(key: key);
  static const routeName = '/slack-auth-screen';

  @override
  State<SlackAuthScreen> createState() => _SlackAuthScreenState();
}

class _SlackAuthScreenState extends State<SlackAuthScreen> {
  final _storage = const FlutterSecureStorage();
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    var _url =
        'https://slack.com//oauth/v2/authorize?scope=channels:read&client_id=3339602036704.3313088374389&client_secret=28215e16efe5dc6721ccab7f2e55d51c&redirect_uri=https://mattpake.page.link/start';

    return WebView(
      initialUrl: _url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        log('WebView is loading (progress : $progress%)');
      },
      navigationDelegate: (NavigationRequest request) async {
        if (request.url.contains('start?code=')) {
          String code = request.url.split('code=').last.split('&state').first;
          var token = await fetchToken(code);

          _storage.deleteAll();
          await _storage.write(key: 'token', value: token.accessToken);

          Navigator.pushNamed(
            context,
            HomeScreen.routeName,
          );
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    );
  }
}
