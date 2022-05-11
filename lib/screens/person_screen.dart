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
      body: SingleChildScrollView(
        child: Column(
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
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: whiteColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0.2, 2), // Shadow position
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              child: Image.asset(
                                'assets/images/package.jpeg',
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 1.2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 38.0, top: 8.0),
                              child: Text(
                                'Package',
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        sendMessage('Message "You have delivery" send to ${args.member.name}');
                        sendDirectMessage(
                            'You have order and delivery waiting at reception.', args.member.id);
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0.2, 2), // Shadow position
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            child: Image.asset(
                              'assets/images/interview.jpg',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 1.2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 38.0, top: 8.0),
                            child: Text(
                              'Interview',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      sendMessage('Message "Candidate waiting"send to ${args.member.name}');
                      sendDirectMessage('Candidate is waiting at the reception.', args.member.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
