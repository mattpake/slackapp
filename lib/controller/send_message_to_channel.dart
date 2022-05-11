import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<void> sendMessage(String message) async {
  const _storage = FlutterSecureStorage();
  String? token;
  await _storage.read(key: 'token').then((value) => token = value);

  final response = await http.post(
    Uri.parse('https://slack.com/api/chat.postMessage'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(
      <String, String>{
        'text': message,
        'channel': 'C0399E4G2BX',
      },
    ),
  );
  if (response.statusCode == 200) {
    log('Message send.');
  } else {
    throw Exception('Failed to send message.');
  }
}
