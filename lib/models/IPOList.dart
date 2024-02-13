import 'dart:convert';

class IpoList {
  String? status;
  String? message;
  List<ActiveIpoList>? activeIpoList;

  IpoList({
    this.status,
    this.message,
    this.activeIpoList,
  });

  factory IpoList.fromRawJson(String str) => IpoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IpoList.fromJson(Map<String, dynamic> json) => IpoList(
    status: json["status"],
    message: json["message"],
    activeIpoList: json["activeIPOList"] == null ? [] : List<ActiveIpoList>.from(json["activeIPOList"]!.map((x) => ActiveIpoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "activeIPOList": activeIpoList == null ? [] : List<dynamic>.from(activeIpoList!.map((x) => x.toJson())),
  };
}

class ActiveIpoList {
  String? ipoid;
  String? ipoName;

  ActiveIpoList({
    this.ipoid,
    this.ipoName,
  });

  factory ActiveIpoList.fromRawJson(String str) => ActiveIpoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActiveIpoList.fromJson(Map<String, dynamic> json) => ActiveIpoList(
    ipoid: json["ipoid"],
    ipoName: json["ipoName"],
  );

  Map<String, dynamic> toJson() => {
    "ipoid": ipoid,
    "ipoName": ipoName,
  };
}
