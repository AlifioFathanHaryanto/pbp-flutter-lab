// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<WatchList> watchlistFromJson(String str) => List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String welcomeToJson(List<WatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
    WatchList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };


static Future<List<WatchList>> fetchWatchList() async {
  var linkUrl = Uri.parse('https://aplikasi-fio.herokuapp.com/mywatchlist/json/');
   var response = await http.get(
        linkUrl,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );

  var dataJson = jsonDecode(utf8.decode(response.bodyBytes));
   List<WatchList> listWatchList = [];
        for (var d in dataJson) {
        if (d != null) {
            listWatchList.add(WatchList.fromJson(d));
        }
        }
        return listWatchList;
}
}

class Fields {
    Fields({
        required this.watched,
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.review,
    });

    Watched? watched;
    String title;
    int rating;
    DateTime releaseDate;
    String review;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: watchedValues.map[json["watched"]],
        title: json["title"],
        rating: json["rating"],
        releaseDate: json["release_date"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watchedValues.reverse[watched],
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
    };
}

enum Watched { YES, NO }

final watchedValues = EnumValues({
    "No": Watched.NO,
    "Yes": Watched.YES
});

enum Model { MYWATCHLIST_MY_WATCH_LIST }

final modelValues = EnumValues({
    "mywatchlist.MyWatchList": Model.MYWATCHLIST_MY_WATCH_LIST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
