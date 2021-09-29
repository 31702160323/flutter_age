class AniPre {
  AniPre({
    required this.aid,
    required this.title,
    required this.newTitle,
    required this.picSmall,
    required this.href,
  });

  final String aid;
  final String title;
  final String newTitle;
  final String picSmall;
  final String href;

  factory AniPre.fromJson(Map<String, dynamic> json) => AniPre(
    aid: json["AID"],
    title: json["Title"],
    newTitle: json["NewTitle"],
    picSmall: json["PicSmall"],
    href: json["Href"],
  );

  Map<String, dynamic> toJson() => {
    "AID": aid,
    "Title": title,
    "NewTitle": newTitle,
    "PicSmall": picSmall,
    "Href": href,
  };
}