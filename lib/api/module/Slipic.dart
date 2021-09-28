class Slipic {
  final String AID;
  final String Title;
  final String NewTitle;
  final String PicUrl;
  final int Time;

  const Slipic({
    required this.AID,
    required this.Title,
    required this.NewTitle,
    required this.PicUrl,
    required this.Time
});

  factory Slipic.fromJson(Map<String, dynamic> json) {
    return Slipic(
      AID: json['AID'] as String,
      Title: json['Title'] as String,
      NewTitle: json['NewTitle'] as String,
      PicUrl: json['PicUrl'] as String,
      Time: json['Time'] as int,
    );
  }
}