class XinfansInfo {
  XinfansInfo({
    required this.isnew,
    required this.id,
    required this.wd,
    required this.name,
    required this.mtime,
    required this.namefornew,
  });

  final bool isnew;
  final String id;
  final int wd;
  final String name;
  final DateTime mtime;
  final String namefornew;

  factory XinfansInfo.fromJson(Map<String, dynamic> json) => XinfansInfo(
    isnew: json["isnew"],
    id: json["id"],
    wd: json["wd"],
    name: json["name"],
    mtime: DateTime.parse(json["mtime"]),
    namefornew: json["namefornew"],
  );

  Map<String, dynamic> toJson() => {
    "isnew": isnew,
    "id": id,
    "wd": wd,
    "name": name,
    "mtime": mtime.toIso8601String(),
    "namefornew": namefornew,
  };
}