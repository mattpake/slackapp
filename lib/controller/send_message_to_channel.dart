import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<void> sendMessage(String message) async {
  final response = await http.post(
    Uri.parse('https://hoks.slack.com/services/T039ZHQ12LQ/B0395N9B3QE/bIPQeUWjqK1OS8TmimZI8l6z'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'text': message,
      },
    ),
  );
  if (response.body == 'ok') {
    log('Message send.');
  } else {
    throw Exception('Failed to send message.');
  }
}
