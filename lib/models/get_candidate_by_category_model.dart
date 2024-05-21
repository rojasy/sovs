// To parse this JSON data, do
//
//     final getAllCandidateByElectionCategoryResponse = getAllCandidateByElectionCategoryResponseFromJson(jsonString);

import 'dart:convert';

GetAllCandidateByElectionCategoryResponse getAllCandidateByElectionCategoryResponseFromJson(String str) => GetAllCandidateByElectionCategoryResponse.fromJson(json.decode(str));

String getAllCandidateByElectionCategoryResponseToJson(GetAllCandidateByElectionCategoryResponse data) => json.encode(data.toJson());

class GetAllCandidateByElectionCategoryResponse {
  GetAllCandidateByElectionCategory getAllCandidateByElectionCategory;

  GetAllCandidateByElectionCategoryResponse({
    required this.getAllCandidateByElectionCategory,
  });

  factory GetAllCandidateByElectionCategoryResponse.fromJson(Map<String, dynamic> json) => GetAllCandidateByElectionCategoryResponse(
    getAllCandidateByElectionCategory: GetAllCandidateByElectionCategory.fromJson(json["getAllCandidateByElectionCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "getAllCandidateByElectionCategory": getAllCandidateByElectionCategory.toJson(),
  };
}

class GetAllCandidateByElectionCategory {
  List<CandidatesContent> content;

  GetAllCandidateByElectionCategory({
    required this.content,
  });

  factory GetAllCandidateByElectionCategory.fromJson(Map<String, dynamic> json) => GetAllCandidateByElectionCategory(
    content: List<CandidatesContent>.from(json["content"].map((x) => CandidatesContent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class CandidatesContent {
  String description;
  Election election;
  int id;
  String title;
  String uuid;
  UserAccount userAccount;

  CandidatesContent({
    required this.description,
    required this.election,
    required this.id,
    required this.title,
    required this.uuid,
    required this.userAccount,
  });

  factory CandidatesContent.fromJson(Map<String, dynamic> json) => CandidatesContent(
    description: json["description"],
    election: Election.fromJson(json["election"]),
    id: json["id"],
    title: json["title"],
    uuid: json["uuid"],
    userAccount: UserAccount.fromJson(json["userAccount"]),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "election": election.toJson(),
    "id": id,
    "title": title,
    "uuid": uuid,
    "userAccount": userAccount.toJson(),
  };
}

class Election {
  String category;
  String description;
  int id;
  String name;
  String uuid;
  int year;

  Election({
    required this.category,
    required this.description,
    required this.id,
    required this.name,
    required this.uuid,
    required this.year,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
    category: json["category"],
    description: json["description"],
    id: json["id"],
    name: json["name"],
    uuid: json["uuid"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "description": description,
    "id": id,
    "name": name,
    "uuid": uuid,
    "year": year,
  };
}

class UserAccount {
  bool active;
  String firstName;
  String fullName;
  int id;
  String lastName;
  String phone;
  String username;
  String uuid;
  String email;

  UserAccount({
    required this.active,
    required this.firstName,
    required this.fullName,
    required this.id,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.uuid,
    required this.email,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    active: json["active"],
    firstName: json["firstName"],
    fullName: json["fullName"],
    id: json["id"],
    lastName: json["lastName"],
    phone: json["phone"],
    username: json["username"],
    uuid: json["uuid"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "firstName": firstName,
    "fullName": fullName,
    "id": id,
    "lastName": lastName,
    "phone": phone,
    "username": username,
    "uuid": uuid,
    "email": email,
  };
}
