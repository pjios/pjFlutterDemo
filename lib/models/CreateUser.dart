import 'dart:convert';

class CreateUser {
  int? id;
  String? username;
  String? token;

  CreateUser({
    this.id,
    this.username,
    this.token,
  });

  factory CreateUser.fromRawJson(String str) => CreateUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateUser.fromJson(Map<String, dynamic> json) => CreateUser(
    id: json["id"],
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "token": token,
  };
}
