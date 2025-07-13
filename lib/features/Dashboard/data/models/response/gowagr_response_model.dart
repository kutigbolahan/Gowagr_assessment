// ignore_for_file: no_leading_underscores_for_local_identifiers

class GowagrModelResponse {
    List<Events>? events;
    Pagination? pagination;

    GowagrModelResponse({this.events, this.pagination});

    GowagrModelResponse.fromJson(Map<String, dynamic> json) {
        events = json["events"] == null ? null : (json["events"] as List).map((e) => Events.fromJson(e)).toList();
        pagination = json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(events != null) {
            _data["events"] = events?.map((e) => e.toJson()).toList();
        }
        if(pagination != null) {
            _data["pagination"] = pagination?.toJson();
        }
        return _data;
    }
}

class Pagination {
    int? page;
    int? size;
    int? totalCount;
    int? lastPage;

    Pagination({this.page, this.size, this.totalCount, this.lastPage});

    Pagination.fromJson(Map<String, dynamic> json) {
        page = json["page"];
        size = json["size"];
        totalCount = json["totalCount"];
        lastPage = json["lastPage"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["page"] = page;
        _data["size"] = size;
        _data["totalCount"] = totalCount;
        _data["lastPage"] = lastPage;
        return _data;
    }
}

class Events {
    String? createdAt;
    List<Markets>? markets;
    dynamic resolvedAt;
    String? imageUrl;
    String? image128Url;
    String? id;
    String? title;
    String? type;
    String? description;
    String? category;
    List<String>? hashtags;
    List<dynamic>? countryCodes;
    List<dynamic>? regions;
    String? status;
    String? resolutionDate;
    dynamic resolutionSource;
    List<String>? supportedCurrencies;
    dynamic totalVolume;
    dynamic totalOrders;

    Events({this.createdAt, this.markets, this.resolvedAt, this.imageUrl, this.image128Url, this.id, this.title, this.type, this.description, this.category, this.hashtags, this.countryCodes, this.regions, this.status, this.resolutionDate, this.resolutionSource, this.supportedCurrencies, this.totalVolume, this.totalOrders});

    Events.fromJson(Map<String, dynamic> json) {
        createdAt = json["createdAt"];
        markets = json["markets"] == null ? null : (json["markets"] as List).map((e) => Markets.fromJson(e)).toList();
        resolvedAt = json["resolvedAt"];
        imageUrl = json["imageUrl"];
        image128Url = json["image128Url"];
        id = json["id"];
        title = json["title"];
        type = json["type"];
        description = json["description"];
        category = json["category"];
        hashtags = json["hashtags"] == null ? null : List<String>.from(json["hashtags"]);
        countryCodes = json["countryCodes"] ?? [];
        regions = json["regions"] ?? [];
        status = json["status"];
        resolutionDate = json["resolutionDate"];
        resolutionSource = json["resolutionSource"];
        supportedCurrencies = json["supportedCurrencies"] == null ? null : List<String>.from(json["supportedCurrencies"]);
        totalVolume = json["totalVolume"];
        totalOrders = json["totalOrders"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["createdAt"] = createdAt;
        if(markets != null) {
            _data["markets"] = markets?.map((e) => e.toJson()).toList();
        }
        _data["resolvedAt"] = resolvedAt;
        _data["imageUrl"] = imageUrl;
        _data["image128Url"] = image128Url;
        _data["id"] = id;
        _data["title"] = title;
        _data["type"] = type;
        _data["description"] = description;
        _data["category"] = category;
        if(hashtags != null) {
            _data["hashtags"] = hashtags;
        }
        if(countryCodes != null) {
            _data["countryCodes"] = countryCodes;
        }
        if(regions != null) {
            _data["regions"] = regions;
        }
        _data["status"] = status;
        _data["resolutionDate"] = resolutionDate;
        _data["resolutionSource"] = resolutionSource;
        if(supportedCurrencies != null) {
            _data["supportedCurrencies"] = supportedCurrencies;
        }
        _data["totalVolume"] = totalVolume;
        _data["totalOrders"] = totalOrders;
        return _data;
    }
}

class Markets {
    String? id;
    String? title;
    String? rules;
    String? imageUrl;
    String? image128Url;
    dynamic yesBuyPrice;
    dynamic noBuyPrice;
    dynamic yesPriceForEstimate;
   dynamic noPriceForEstimate;
    String? status;
    dynamic resolvedOutcome;
    dynamic volumeValueYes;
    dynamic volumeValueNo;
    dynamic yesProfitForEstimate;
    dynamic noProfitForEstimate;

    Markets({this.id, this.title, this.rules, this.imageUrl, this.image128Url, this.yesBuyPrice, this.noBuyPrice, this.yesPriceForEstimate, this.noPriceForEstimate, this.status, this.resolvedOutcome, this.volumeValueYes, this.volumeValueNo, this.yesProfitForEstimate, this.noProfitForEstimate});

    Markets.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        rules = json["rules"];
        imageUrl = json["imageUrl"];
        image128Url = json["image128Url"];
        yesBuyPrice = json["yesBuyPrice"];
        noBuyPrice = json["noBuyPrice"];
        yesPriceForEstimate = json["yesPriceForEstimate"];
        noPriceForEstimate = json["noPriceForEstimate"];
        status = json["status"];
        resolvedOutcome = json["resolvedOutcome"];
        volumeValueYes = json["volumeValueYes"];
        volumeValueNo = json["volumeValueNo"];
        yesProfitForEstimate = json["yesProfitForEstimate"];
        noProfitForEstimate = json["noProfitForEstimate"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["rules"] = rules;
        _data["imageUrl"] = imageUrl;
        _data["image128Url"] = image128Url;
        _data["yesBuyPrice"] = yesBuyPrice;
        _data["noBuyPrice"] = noBuyPrice;
        _data["yesPriceForEstimate"] = yesPriceForEstimate;
        _data["noPriceForEstimate"] = noPriceForEstimate;
        _data["status"] = status;
        _data["resolvedOutcome"] = resolvedOutcome;
        _data["volumeValueYes"] = volumeValueYes;
        _data["volumeValueNo"] = volumeValueNo;
        _data["yesProfitForEstimate"] = yesProfitForEstimate;
        _data["noProfitForEstimate"] = noProfitForEstimate;
        return _data;
    }
}