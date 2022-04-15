import 'package:flutter/material.dart';
import 'package:slackapp/hex_colors.dart';
import 'package:slackapp/screens/home_page.dart';
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
        '/': (context) => const MyHomePage(title: 'Home Page'),
        //https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
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
