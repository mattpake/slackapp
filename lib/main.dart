import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:slackapp/hex_colors.dart';
import 'package:slackapp/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slackapp/screens/person_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slack App',
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
              splash: Image.asset('assets/images/heureka_logo.png'),
              duration: 2000,
              nextScreen: const HomeScreen(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 120,
              pageTransitionType: PageTransitionType.rightToLeft,
            ),
        //https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
        HomeScreen.routeName: (context) => const HomeScreen(),
        PersonScreen.routeName: (context) => const PersonScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: blueColor,
        ),
      ),
    );
  }
}
