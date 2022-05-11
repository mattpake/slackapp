import 'package:flutter/material.dart';
import 'package:slackapp/screens/slack_auth_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static const routeName = '/authentication-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: 56,
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/slack_icon.png',
                      height: 24,
                      width: 24,
                    ),
                    const Text(
                      '   Sign in with ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const Text(
                      'Slack',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    SlackAuthScreen.routeName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
