import 'package:slackapp/dto/member.dart';

class ScreenArguments {
  final String title;
  final String message;
  final Member member;

  ScreenArguments(this.title, this.message, this.member);
}