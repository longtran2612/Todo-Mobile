import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.username,
    required this.roles,
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
  });
  String username;
  String roles;
  String tokenType;
  String accessToken;
  String refreshToken;

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        username: json['username'] ?? "",
        roles: json['roles'] ?? "",
        tokenType: json['tokenType'] ?? "",
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );
  Map<String, dynamic> toJson() => {
        "username": username,
        "roles": roles,
        "tokenType": tokenType,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
