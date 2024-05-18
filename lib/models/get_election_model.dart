// To parse this JSON data, do
//
//     final getAllElectionResponse = getAllElectionResponseFromJson(jsonString);

import 'dart:convert';

GetAllElectionResponse getAllElectionResponseFromJson(String str) => GetAllElectionResponse.fromJson(json.decode(str));

String getAllElectionResponseToJson(GetAllElectionResponse data) => json.encode(data.toJson());

class GetAllElectionResponse {
  GetAllElection getAllElection;

  GetAllElectionResponse({
    required this.getAllElection,
  });

  factory GetAllElectionResponse.fromJson(Map<String, dynamic> json) => GetAllElectionResponse(
    getAllElection: GetAllElection.fromJson(json["getAllElection"]),
  );

  Map<String, dynamic> toJson() => {
    "getAllElection": getAllElection.toJson(),
  };
}

class GetAllElection {
  List<Content> content;

  GetAllElection({
    required this.content,
  });

  factory GetAllElection.fromJson(Map<String, dynamic> json) => GetAllElection(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class Content {
  bool active;
  String category;
  String description;
  int id;
  String name;
  String uuid;
  int year;

  Content({
    required this.active,
    required this.category,
    required this.description,
    required this.id,
    required this.name,
    required this.uuid,
    required this.year,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    active: json["active"],
    category: json["category"],
    description: json["description"],
    id: json["id"],
    name: json["name"],
    uuid: json["uuid"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "category": category,
    "description": description,
    "id": id,
    "name": name,
    "uuid": uuid,
    "year": year,
  };
}
