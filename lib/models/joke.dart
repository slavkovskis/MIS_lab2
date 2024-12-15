import 'dart:convert';

List<Joke> jokeFromJson(String str) => List<Joke>.from(json.decode(str).map((x) => Joke.fromJson(x)));

String jokeToJson(List<Joke> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Joke {
  final int id;
  final String type;
  final String setup;
  final String punchline;

  Joke({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  Joke copyWith({
    int? id,
    String? type,
    String? setup,
    String? punchline,
  }) =>
      Joke(
        id: id ?? this.id,
        type: type ?? this.type,
        setup: setup ?? this.setup,
        punchline: punchline ?? this.punchline,
      );

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
    id: json["id"],
    type: json["type"],
    setup: json["setup"],
    punchline: json["punchline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "setup": setup,
    "punchline": punchline,
  };
}
