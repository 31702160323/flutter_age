import 'dart:convert';

import 'AniPre.dart';
import 'XinfansInfo.dart';

AniPreUpList aniPreUpListFromJson(String str) => AniPreUpList.fromJson(json.decode(str));

String aniPreUpListToJson(AniPreUpList data) => json.encode(data.toJson());

class AniPreUpList {
  AniPreUpList({
    required this.aniPreUp,
    required this.aniPreEvDay,
    required this.xinfansInfo,
    required this.tip,
  });

  final List<AniPre> aniPreUp;
  final List<AniPre> aniPreEvDay;
  final List<XinfansInfo> xinfansInfo;
  final String tip;

  factory AniPreUpList.fromJson(Map<String, dynamic> json) => AniPreUpList(
    aniPreUp: List<AniPre>.from(json["AniPreUP"].map((x) => AniPre.fromJson(x))),
    aniPreEvDay: List<AniPre>.from(json["AniPreEvDay"].map((x) => AniPre.fromJson(x))),
    xinfansInfo: List<XinfansInfo>.from(json["XinfansInfo"].map((x) => XinfansInfo.fromJson(x))),
    tip: json["Tip"],
  );

  Map<String, dynamic> toJson() => {
    "AniPreUP": List<dynamic>.from(aniPreUp.map((x) => x.toJson())),
    "AniPreEvDay": List<dynamic>.from(aniPreEvDay.map((x) => x.toJson())),
    "XinfansInfo": List<dynamic>.from(xinfansInfo.map((x) => x.toJson())),
    "Tip": tip,
  };
}
