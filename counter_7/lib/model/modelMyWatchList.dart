import 'dart:convert';
import 'package:http/http.dart' as http;

List<Mywatchlist> watchlistFromJson(String str) =>
    List<Mywatchlist>.from(json.decode(str).map((x) => Mywatchlist.fromJson(x)));

String watchlistToJson(List<Mywatchlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mywatchlist {
  Mywatchlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Mywatchlist.fromJson(Map<String, dynamic> json) => Mywatchlist(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };

  static Future<List<Mywatchlist>> fetchWatchList() async {
    var url =
        Uri.parse('https://aplikasi-fio.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Mywatchlist> listWatchList = [];
    for (var d in data) {
      if (d != null) {
        listWatchList.add(Mywatchlist.fromJson(d));
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
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
      };
}

enum Watched { YES, NO }

final watchedValues = EnumValues({"No": Watched.NO, "Yes": Watched.YES});

enum Model { MYWATCHLIST_MY_WATCH_LIST }

final modelValues =
    EnumValues({"mywatchlist.MyWatchList": Model.MYWATCHLIST_MY_WATCH_LIST});

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
