import 'package:hive/hive.dart';
part 'markerts.g.dart';


@HiveType(typeId: 1)
class Markets {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? rules;

  @HiveField(3)
  String? imageUrl;

  @HiveField(4)
  String? image128Url;

  @HiveField(5)
  dynamic yesBuyPrice;

  @HiveField(6)
  dynamic noBuyPrice;

  @HiveField(7)
  dynamic yesPriceForEstimate;

  @HiveField(8)
  dynamic noPriceForEstimate;

  @HiveField(9)
  String? status;

  @HiveField(10)
  dynamic resolvedOutcome;

  @HiveField(11)
  dynamic volumeValueYes;

  @HiveField(12)
  dynamic volumeValueNo;

  @HiveField(13)
  dynamic yesProfitForEstimate;

  @HiveField(14)
  dynamic noProfitForEstimate;

  Markets({
    this.id,
    this.title,
    this.rules,
    this.imageUrl,
    this.image128Url,
    this.yesBuyPrice,
    this.noBuyPrice,
    this.yesPriceForEstimate,
    this.noPriceForEstimate,
    this.status,
    this.resolvedOutcome,
    this.volumeValueYes,
    this.volumeValueNo,
    this.yesProfitForEstimate,
    this.noProfitForEstimate,
  });

  factory Markets.fromJson(Map<String, dynamic> json) => Markets(
        id: json["id"],
        title: json["title"],
        rules: json["rules"],
        imageUrl: json["imageUrl"],
        image128Url: json["image128Url"],
        yesBuyPrice: json["yesBuyPrice"],
        noBuyPrice: json["noBuyPrice"],
        yesPriceForEstimate: json["yesPriceForEstimate"],
        noPriceForEstimate: json["noPriceForEstimate"],
        status: json["status"],
        resolvedOutcome: json["resolvedOutcome"],
        volumeValueYes: json["volumeValueYes"],
        volumeValueNo: json["volumeValueNo"],
        yesProfitForEstimate: json["yesProfitForEstimate"],
        noProfitForEstimate: json["noProfitForEstimate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "rules": rules,
        "imageUrl": imageUrl,
        "image128Url": image128Url,
        "yesBuyPrice": yesBuyPrice,
        "noBuyPrice": noBuyPrice,
        "yesPriceForEstimate": yesPriceForEstimate,
        "noPriceForEstimate": noPriceForEstimate,
        "status": status,
        "resolvedOutcome": resolvedOutcome,
        "volumeValueYes": volumeValueYes,
        "volumeValueNo": volumeValueNo,
        "yesProfitForEstimate": yesProfitForEstimate,
        "noProfitForEstimate": noProfitForEstimate,
      };
}
