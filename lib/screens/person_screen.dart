import 'package:flutter/material.dart';
import 'package:slackapp/controller/sendDirectMessage.dart';
import 'package:slackapp/controller/sendMessageToChannel.dart';
import 'package:slackapp/dto/screen_arguments.dart';
import 'package:http/http.dart' as http;

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static const routeName = '/person-screen';

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  Future<http.Response>? _messageResponse;

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
              child: ElevatedButton(
                onPressed: () {
                  sendMessage('Message 1');
                  sendDirectMessage('Message DM', 'U039C5CRYMS');
                },
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
