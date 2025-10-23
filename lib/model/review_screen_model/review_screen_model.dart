// To parse this JSON data, do
//
//     final reviwFetching = reviwFetchingFromJson(jsonString);

import 'dart:convert';

ReviwFetching reviwFetchingFromJson(String str) => ReviwFetching.fromJson(json.decode(str));

String reviwFetchingToJson(ReviwFetching data) => json.encode(data.toJson());

class ReviwFetching {
    int? id;
    String? title;
    String? body;
    List<String>? tags;
    Reactions? reactions;
    int? views;
    int? userId;

    ReviwFetching({
        this.id,
        this.title,
        this.body,
        this.tags,
        this.reactions,
        this.views,
        this.userId,
    });

    factory ReviwFetching.fromJson(Map<String, dynamic> json) => ReviwFetching(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        reactions: json["reactions"] == null ? null : Reactions.fromJson(json["reactions"]),
        views: json["views"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "reactions": reactions?.toJson(),
        "views": views,
        "userId": userId,
    };
}

class Reactions {
    int? likes;
    int? dislikes;

    Reactions({
        this.likes,
        this.dislikes,
    });

    factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        likes: json["likes"],
        dislikes: json["dislikes"],
    );

    Map<String, dynamic> toJson() => {
        "likes": likes,
        "dislikes": dislikes,
    };
}