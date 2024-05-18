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
  bool active;
  String description;
  Election election;
  int id;
  String title;
  UserAccount userAccount;
  String uuid;

  CandidatesContent({
    required this.active,
    required this.description,
    required this.election,
    required this.id,
    required this.title,
    required this.userAccount,
    required this.uuid,
  });

  factory CandidatesContent.fromJson(Map<String, dynamic> json) => CandidatesContent(
    active: json["active"],
    description: json["description"],
    election: Election.fromJson(json["election"]),
    id: json["id"],
    title: json["title"],
    userAccount: UserAccount.fromJson(json["userAccount"]),
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "description": description,
    "election": election.toJson(),
    "id": id,
    "title": title,
    "userAccount": userAccount.toJson(),
    "uuid": uuid,
  };
}

class Election {
  bool active;
  String category;
  String description;
  int id;
  String name;
  String uuid;
  int year;

  Election({
    required this.active,
    required this.category,
    required this.description,
    required this.id,
    required this.name,
    required this.uuid,
    required this.year,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
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

class UserAccount {
  bool active;
  String email;
  String fullName;
  int id;
  String phone;
  String username;
  String uuid;

  UserAccount({
    required this.active,
    required this.email,
    required this.fullName,
    required this.id,
    required this.phone,
    required this.username,
    required this.uuid,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    active: json["active"],
    email: json["email"],
    fullName: json["fullName"],
    id: json["id"],
    phone: json["phone"],
    username: json["username"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "email": email,
    "fullName": fullName,
    "id": id,
    "phone": phone,
    "username": username,
    "uuid": uuid,
  };
}
