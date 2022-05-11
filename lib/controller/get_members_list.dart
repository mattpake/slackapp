import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:slackapp/dto/member.dart';

Future<List<Member>> fetchMembers() async {
  const _storage = FlutterSecureStorage();
  String? token;
  await _storage.read(key: 'token').then((value) => token = value);

  final response = await http.get(
    Uri.parse('https://slack.com/api/users.list'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
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
    throw Exception('Failed to load member');
  }
}
