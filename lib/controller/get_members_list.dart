import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slackapp/dto/member.dart';

Future<List<Member>> fetchMembers() async {
  final response = await http.get(
    Uri.parse('https://slack.com/api/users.list'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer xoxb-3339602036704-3339756025056-54oEujKgCVXaTGznf8xIKaNG',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> jsonMap = json.decode(response.body);
    List<dynamic> dataMap = jsonMap['members'];
    return dataMap.map<Member>((e) => Member.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
