import 'package:flutter/material.dart';
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
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(title: 'Home Page'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/person-screen': (context) => const PersonScreen(title: '',),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
