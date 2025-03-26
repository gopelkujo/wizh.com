import 'dart:convert';

List<TripDetailModel> tripDetailModelFromJson(String str) => List<TripDetailModel>.from(json.decode(str).map((x) => TripDetailModel.fromJson(x)));

String tripDetailModelToJson(List<TripDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TripDetailModel {
    final String? id;
    final String? title;
    final String? photos;
    final String? summary;
    final String? ratingReview;
    final String? tnc;
    final String? price;
    final String? pax;

    TripDetailModel({
        this.id,
        this.title,
        this.photos,
        this.summary,
        this.ratingReview,
        this.tnc,
        this.price,
        this.pax,
    });

    factory TripDetailModel.fromJson(Map<String, dynamic> json) => TripDetailModel(
        id: json["id"],
        title: json["title"],
        photos: json["photos"],
        summary: json["summary"],
        ratingReview: json["rating_review"],
        tnc: json["tnc"],
        price: json["price"],
        pax: json["pax"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photos": photos,
        "summary": summary,
        "rating_review": ratingReview,
        "tnc": tnc,
        "price": price,
        "pax": pax,
    };
}
