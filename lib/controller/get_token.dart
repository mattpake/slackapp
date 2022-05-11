import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slackapp/dto/token.dart';

Future<Token> fetchToken(String code) async {
  final response = await http.get(
    Uri.parse(
        'https://slack.com/api/oauth.v2.access?code=$code&client_id=3339602036704.3313088374389&client_secret=28215e16efe5dc6721ccab7f2e55d51c'),
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> jsonMap = json.decode(response.body);
    return Token.fromJson(jsonMap);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load token');
  }
}
