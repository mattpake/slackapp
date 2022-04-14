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
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {
                  sendMessage('Message "You have delivery" send to ${args.member.name}');
                  sendDirectMessage(
                      'You have order and delivery waiting at reception.', args.member.id);
                },
                child: const Text(
                  'Package',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Container(
              width: 200,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.grey,
              child: TextButton(
                onPressed: () {
                  sendMessage('Message "Candidate waiting"send to ${args.member.name}');
                  sendDirectMessage('Candidate is waiting at the reception.', args.member.id);
                },
                child: const Text(
                  'Interview',
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
