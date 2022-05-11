class Token {
  final bool ok;
  final String appId;
  final String scope;
  final String accessToken;

  Token({required this.accessToken, required this.ok, required this.appId, required this.scope});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        accessToken: json['access_token'] as String,
        ok: json['ok'] as bool,
        appId: json['app_id'] as String,
        scope: json['scope'] as String);
  }
}
