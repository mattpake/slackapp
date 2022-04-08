class Member {
  final String id;
  final String teamId;
  final String name;
  final String realName;

  Member({required this.id, required this.teamId, required this.name, required this.realName});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['id'] as String,
        teamId: json['team_id'] as String,
        name: json['name'] as String,
        realName: json['real_name'] as String);
  }
}
