import 'dart:convert';

class IpoList {
  String? status;
  String? message;
  List<IpoListElement>? ipoList;

  IpoList({
    this.status,
    this.message,
    this.ipoList,
  });

  factory IpoList.fromRawJson(String str) => IpoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IpoList.fromJson(Map<String, dynamic> json) => IpoList(
    status: json["status"],
    message: json["message"],
    ipoList: json["IPOList"] == null ? [] : List<IpoListElement>.from(json["IPOList"]!.map((x) => IpoListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "IPOList": ipoList == null ? [] : List<dynamic>.from(ipoList!.map((x) => x.toJson())),
  };
}

class IpoListElement {
  String? ipoid;
  String? ipoName;

  IpoListElement({
    this.ipoid,
    this.ipoName,
  });

  factory IpoListElement.fromRawJson(String str) => IpoListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IpoListElement.fromJson(Map<String, dynamic> json) => IpoListElement(
    ipoid: json["ipoid"],
    ipoName: json["ipoName"],
  );

  Map<String, dynamic> toJson() => {
    "ipoid": ipoid,
    "ipoName": ipoName,
  };
}
