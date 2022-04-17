import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:slackapp/controller/send_direct_message.dart';
import 'package:slackapp/controller/send_message_to_channel.dart';
import 'package:slackapp/dto/screen_arguments.dart';
import 'package:slackapp/hex_colors.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static const routeName = '/person-screen';

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: orangeColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 18),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                  child: ClayContainer(
                    curveType: CurveType.none,
                    borderRadius: 25,
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 4,
                    color: whiteColor,
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
                ),
                // SizedBox(height: 50,),
                ClayContainer(
                  curveType: CurveType.none,
                  borderRadius: 25,
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 4,
                  color: whiteColor,
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
        ],
      ),
    );
  }
}
