import 'dart:convert';

List<TripModel> tripModelFromJson(String str) => List<TripModel>.from(json.decode(str).map((x) => TripModel.fromJson(x)));

String tripModelToJson(List<TripModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TripModel {
    final String id;
    final String? title;
    final String? photo;
    final String? ratings;
    final String? price;

    TripModel({
        required this.id,
        this.title,
        this.photo,
        this.ratings,
        this.price,
    });

    factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        id: json["id"],
        title: json["title"],
        photo: json["photo"],
        ratings: json["ratings"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photo": photo,
        "ratings": ratings,
        "price": price,
    };
}
