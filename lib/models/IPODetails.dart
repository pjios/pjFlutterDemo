import 'dart:convert';

class IpoDetails {
  String? status;
  String? message;
  List<ActiveIpoList>? activeIpoList;

  IpoDetails({
    this.status,
    this.message,
    this.activeIpoList,
  });

  factory IpoDetails.fromRawJson(String str) => IpoDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IpoDetails.fromJson(Map<String, dynamic> json) => IpoDetails(
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
  String? name;
  int? ipoid;
  String? code;
  int? miNQty;
  int? maXQty;
  int? miNPrice;
  int? maXPrice;
  int? ipoCategoryId;
  String? ipoCategoryName;
  String? issuEStartDate;
  String? issuEEndDate;
  int? discount;
  dynamic applicationNo;
  dynamic bidId;
  dynamic bidStatus;
  bool? isPending;

  ActiveIpoList({
    this.name,
    this.ipoid,
    this.code,
    this.miNQty,
    this.maXQty,
    this.miNPrice,
    this.maXPrice,
    this.ipoCategoryId,
    this.ipoCategoryName,
    this.issuEStartDate,
    this.issuEEndDate,
    this.discount,
    this.applicationNo,
    this.bidId,
    this.bidStatus,
    this.isPending,
  });

  factory ActiveIpoList.fromRawJson(String str) => ActiveIpoList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActiveIpoList.fromJson(Map<String, dynamic> json) => ActiveIpoList(
    name: json["name"],
    ipoid: json["ipoid"],
    code: json["code"],
    miNQty: json["miN_QTY"],
    maXQty: json["maX_QTY"],
    miNPrice: json["miN_PRICE"],
    maXPrice: json["maX_PRICE"],
    ipoCategoryId: json["ipoCategoryId"],
    ipoCategoryName: json["ipoCategoryName"],
    issuEStartDate: json["issuE_START_DATE"],
    issuEEndDate: json["issuE_END_DATE"],
    discount: json["discount"],
    applicationNo: json["applicationNo"],
    bidId: json["bidID"],
    bidStatus: json["bidStatus"],
    isPending: json["isPending"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "ipoid": ipoid,
    "code": code,
    "miN_QTY": miNQty,
    "maX_QTY": maXQty,
    "miN_PRICE": miNPrice,
    "maX_PRICE": maXPrice,
    "ipoCategoryId": ipoCategoryId,
    "ipoCategoryName": ipoCategoryName,
    "issuE_START_DATE": issuEStartDate,
    "issuE_END_DATE": issuEEndDate,
    "discount": discount,
    "applicationNo": applicationNo,
    "bidID": bidId,
    "bidStatus": bidStatus,
    "isPending": isPending,
  };
}
