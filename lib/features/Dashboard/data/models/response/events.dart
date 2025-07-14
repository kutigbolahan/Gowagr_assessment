import 'package:gowagr_assessment/features/Dashboard/data/models/response/gowagr_response_model.dart';
import 'package:hive/hive.dart';
part 'events.g.dart';

@HiveType(typeId: 0)
class Events {
  @HiveField(0)
  String? createdAt;

  @HiveField(1)
  List<Markets>? markets;

  @HiveField(2)
  String? imageUrl;

  @HiveField(3)
  String? image128Url;

  @HiveField(4)
  String? id;

  @HiveField(5)
  String? title;

  @HiveField(6)
  String? type;

  @HiveField(7)
  String? description;

  @HiveField(8)
  String? category;

  @HiveField(9)
  List<String>? hashtags;

  @HiveField(10)
  List<dynamic>? countryCodes;

  @HiveField(11)
  List<dynamic>? regions;

  @HiveField(12)
  String? status;

  @HiveField(13)
  String? resolutionDate;

  @HiveField(14)
  dynamic resolutionSource;

  @HiveField(15)
  List<String>? supportedCurrencies;

  @HiveField(16)
  dynamic totalVolume;

  @HiveField(17)
  dynamic totalOrders;

  Events({
    this.createdAt,
    this.markets,
    this.imageUrl,
    this.image128Url,
    this.id,
    this.title,
    this.type,
    this.description,
    this.category,
    this.hashtags,
    this.countryCodes,
    this.regions,
    this.status,
    this.resolutionDate,
    this.resolutionSource,
    this.supportedCurrencies,
    this.totalVolume,
    this.totalOrders,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        createdAt: json["createdAt"],
        markets: json["markets"] == null
            ? null
            : (json["markets"] as List)
                .map((e) => Markets.fromJson(e))
                .toList(),
        imageUrl: json["imageUrl"],
        image128Url: json["image128Url"],
        id: json["id"],
        title: json["title"],
        type: json["type"],
        description: json["description"],
        category: json["category"],
        hashtags: json["hashtags"] == null
            ? null
            : List<String>.from(json["hashtags"]),
        countryCodes: json["countryCodes"] ?? [],
        regions: json["regions"] ?? [],
        status: json["status"],
        resolutionDate: json["resolutionDate"],
        resolutionSource: json["resolutionSource"],
        supportedCurrencies: json["supportedCurrencies"] == null
            ? null
            : List<String>.from(json["supportedCurrencies"]),
        totalVolume: json["totalVolume"],
        totalOrders: json["totalOrders"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "markets": markets?.map((e) => e.toJson()).toList(),
        "imageUrl": imageUrl,
        "image128Url": image128Url,
        "id": id,
        "title": title,
        "type": type,
        "description": description,
        "category": category,
        "hashtags": hashtags,
        "countryCodes": countryCodes,
        "regions": regions,
        "status": status,
        "resolutionDate": resolutionDate,
        "resolutionSource": resolutionSource,
        "supportedCurrencies": supportedCurrencies,
        "totalVolume": totalVolume,
        "totalOrders": totalOrders,
      };
}
