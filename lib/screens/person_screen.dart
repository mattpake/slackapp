import 'package:flutter/material.dart';
import 'package:slackapp/dto/screen_arguments.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static const routeName = '/person-screen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Message 1',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 200,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Message 2',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 200,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Message 3',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 200,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Message 4',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 200,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Message 5',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 200,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Message 6',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
