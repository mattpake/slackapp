import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<void> sendDirectMessage(String message, String channel) async {
  final response = await http.post(
    Uri.parse('https://slack.com/api/chat.postMessage'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer xoxb-3339602036704-3339756025056-54oEujKgCVXaTGznf8xIKaNG',
    },
    body: jsonEncode(
      <String, String>{
        'text': message,
        'channel': channel,
      },
    ),
  );
  if (response.statusCode == 200) {
    log('Message send.');
  } else {
    throw Exception('Failed to send message.');
  }
}
