import 'dart:developer';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slackapp/hex_colors.dart';
import 'package:slackapp/screens/authentication_screen.dart';
import 'package:slackapp/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slackapp/screens/person_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slackapp/screens/slack_auth_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    initDynamicLinks();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Slack App',
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
              splash: Image.asset('assets/images/heureka_logo.png'),
              duration: 2000,
              nextScreen: const AuthenticationScreen(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 120,
              pageTransitionType: PageTransitionType.rightToLeft,
            ),
        //https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
        HomeScreen.routeName: (context) => const HomeScreen(),
        PersonScreen.routeName: (context) => const PersonScreen(),
        AuthenticationScreen.routeName: (context) => const AuthenticationScreen(),
        SlackAuthScreen.routeName: (context) => const SlackAuthScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: blueColor,
        ),
      ),
    );
  }
}

void initDynamicLinks() async {
  FirebaseDynamicLinks.instance.onLink.listen(
    (dynamicLinkData) {
      final Uri? deepLink = dynamicLinkData.link;
      if (deepLink != null) {
        log(
          'deeplink data ' + deepLink.queryParametersAll.values.toString(),
        );
        Get.toNamed(deepLink.queryParameters.values.first);
      }
    },
  ).onError(
    (error) {
      log(error);
    },
  );
}
