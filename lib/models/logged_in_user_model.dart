// To parse this JSON data, do
//
//     final getLoggedInUserResponse = getLoggedInUserResponseFromJson(jsonString);

import 'dart:convert';

GetLoggedInUserResponse getLoggedInUserResponseFromJson(String str) => GetLoggedInUserResponse.fromJson(json.decode(str));

String getLoggedInUserResponseToJson(GetLoggedInUserResponse data) => json.encode(data.toJson());

class GetLoggedInUserResponse {
  GetLoggedInUser getLoggedInUser;

  GetLoggedInUserResponse({
    required this.getLoggedInUser,
  });

  factory GetLoggedInUserResponse.fromJson(Map<String, dynamic> json) => GetLoggedInUserResponse(
    getLoggedInUser: GetLoggedInUser.fromJson(json["getLoggedInUser"]),
  );

  Map<String, dynamic> toJson() => {
    "getLoggedInUser": getLoggedInUser.toJson(),
  };
}

class GetLoggedInUser {
  int code;
  LoggedUser data;
  bool error;
  String message;

  GetLoggedInUser({
    required this.code,
    required this.data,
    required this.error,
    required this.message,
  });

  factory GetLoggedInUser.fromJson(Map<String, dynamic> json) => GetLoggedInUser(
    code: json["code"],
    data: LoggedUser.fromJson(json["data"]),
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "error": error,
    "message": message,
  };
}

class LoggedUser {
  String email;
  String firstName;
  String fullName;
  int id;
  String lastName;
  String phone;
  List<Role> roles;
  String username;
  String uuid;
  List<Vote> votes;
  bool active;

  LoggedUser({
    required this.email,
    required this.firstName,
    required this.fullName,
    required this.id,
    required this.lastName,
    required this.phone,
    required this.roles,
    required this.username,
    required this.uuid,
    required this.votes,
    required this.active,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
    email: json["email"],
    firstName: json["firstName"],
    fullName: json["fullName"],
    id: json["id"],
    lastName: json["lastName"],
    phone: json["phone"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    username: json["username"],
    uuid: json["uuid"],
    votes: List<Vote>.from(json["votes"].map((x) => Vote.fromJson(x))),
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "fullName": fullName,
    "id": id,
    "lastName": lastName,
    "phone": phone,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    "username": username,
    "uuid": uuid,
    "votes": List<dynamic>.from(votes.map((x) => x.toJson())),
    "active": active,
  };
}

class Role {
  bool active;
  String displayName;
  int id;
  String name;
  String uuid;

  Role({
    required this.active,
    required this.displayName,
    required this.id,
    required this.name,
    required this.uuid,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    active: json["active"],
    displayName: json["displayName"],
    id: json["id"],
    name: json["name"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "displayName": displayName,
    "id": id,
    "name": name,
    "uuid": uuid,
  };
}

class Vote {
  Candidates candidates;
  Election election;
  int id;
  DateTime time;
  String uuid;
  dynamic year;

  Vote({
    required this.candidates,
    required this.election,
    required this.id,
    required this.time,
    required this.uuid,
    required this.year,
  });

  factory Vote.fromJson(Map<String, dynamic> json) => Vote(
    candidates: Candidates.fromJson(json["candidates"]),
    election: Election.fromJson(json["election"]),
    id: json["id"],
    time: DateTime.parse(json["time"]),
    uuid: json["uuid"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "candidates": candidates.toJson(),
    "election": election.toJson(),
    "id": id,
    "time": time.toIso8601String(),
    "uuid": uuid,
    "year": year,
  };
}

class Candidates {
  bool active;
  String description;
  int id;
  String title;
  String uuid;

  Candidates({
    required this.active,
    required this.description,
    required this.id,
    required this.title,
    required this.uuid,
  });

  factory Candidates.fromJson(Map<String, dynamic> json) => Candidates(
    active: json["active"],
    description: json["description"],
    id: json["id"],
    title: json["title"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "description": description,
    "id": id,
    "title": title,
    "uuid": uuid,
  };
}

class Election {
  bool active;
  String category;
  DateTime createdAt;
  dynamic createdBy;
  bool deleted;
  String description;
  int id;
  String name;
  DateTime updatedAt;
  dynamic updatedBy;
  String uuid;
  int year;

  Election({
    required this.active,
    required this.category,
    required this.createdAt,
    required this.createdBy,
    required this.deleted,
    required this.description,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.updatedBy,
    required this.uuid,
    required this.year,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
    active: json["active"],
    category: json["category"],
    createdAt: DateTime.parse(json["createdAt"]),
    createdBy: json["createdBy"],
    deleted: json["deleted"],
    description: json["description"],
    id: json["id"],
    name: json["name"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    updatedBy: json["updatedBy"],
    uuid: json["uuid"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "category": category,
    "createdAt": createdAt.toIso8601String(),
    "createdBy": createdBy,
    "deleted": deleted,
    "description": description,
    "id": id,
    "name": name,
    "updatedAt": updatedAt.toIso8601String(),
    "updatedBy": updatedBy,
    "uuid": uuid,
    "year": year,
  };
}
