// To parse this JSON data, do
//
//     final getAllCandidatesResponse = getAllCandidatesResponseFromJson(jsonString);

import 'dart:convert';

GetAllCandidatesResponse getAllCandidatesResponseFromJson(String str) => GetAllCandidatesResponse.fromJson(json.decode(str));

String getAllCandidatesResponseToJson(GetAllCandidatesResponse data) => json.encode(data.toJson());

class GetAllCandidatesResponse {
  GetAllCandidates getAllCandidates;

  GetAllCandidatesResponse({
    required this.getAllCandidates,
  });

  factory GetAllCandidatesResponse.fromJson(Map<String, dynamic> json) => GetAllCandidatesResponse(
    getAllCandidates: GetAllCandidates.fromJson(json["getAllCandidates"]),
  );

  Map<String, dynamic> toJson() => {
    "getAllCandidates": getAllCandidates.toJson(),
  };
}

class GetAllCandidates {
  List<AllCandidates> content;

  GetAllCandidates({
    required this.content,
  });

  factory GetAllCandidates.fromJson(Map<String, dynamic> json) => GetAllCandidates(
    content: List<AllCandidates>.from(json["content"].map((x) => AllCandidates.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class AllCandidates {
  String title;
  String description;
  String uuid;
  UserAccount userAccount;
  int id;
  bool active;
  Election election;

  AllCandidates({
    required this.title,
    required this.description,
    required this.uuid,
    required this.userAccount,
    required this.id,
    required this.active,
    required this.election,
  });

  factory AllCandidates.fromJson(Map<String, dynamic> json) => AllCandidates(
    title: json["title"],
    description: json["description"],
    uuid: json["uuid"],
    userAccount: UserAccount.fromJson(json["userAccount"]),
    id: json["id"],
    active: json["active"],
    election: Election.fromJson(json["election"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "uuid": uuid,
    "userAccount": userAccount.toJson(),
    "id": id,
    "active": active,
    "election": election.toJson(),
  };
}

class Election {
  String category;
  int id;
  String name;
  String uuid;
  int year;
  bool active;
  String description;

  Election({
    required this.category,
    required this.id,
    required this.name,
    required this.uuid,
    required this.year,
    required this.active,
    required this.description,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
    category: json["category"],
    id: json["id"],
    name: json["name"],
    uuid: json["uuid"],
    year: json["year"],
    active: json["active"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "id": id,
    "name": name,
    "uuid": uuid,
    "year": year,
    "active": active,
    "description": description,
  };
}

class UserAccount {
  String firstName;
  String fullName;
  int id;
  String lastName;
  String username;
  String uuid;
  String email;
  String phone;

  UserAccount({
    required this.firstName,
    required this.fullName,
    required this.id,
    required this.lastName,
    required this.username,
    required this.uuid,
    required this.email,
    required this.phone,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    firstName: json["firstName"],
    fullName: json["fullName"],
    id: json["id"],
    lastName: json["lastName"],
    username: json["username"],
    uuid: json["uuid"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "fullName": fullName,
    "id": id,
    "lastName": lastName,
    "username": username,
    "uuid": uuid,
    "email": email,
    "phone": phone,
  };
}
