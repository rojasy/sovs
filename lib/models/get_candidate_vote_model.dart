// To parse this JSON data, do
//
//     final getCandidateVotesResponse = getCandidateVotesResponseFromJson(jsonString);

import 'dart:convert';

GetCandidateVotesResponse getCandidateVotesResponseFromJson(String str) => GetCandidateVotesResponse.fromJson(json.decode(str));

String getCandidateVotesResponseToJson(GetCandidateVotesResponse data) => json.encode(data.toJson());

class GetCandidateVotesResponse {
  GetCandidateVotes getCandidateVotes;

  GetCandidateVotesResponse({
    required this.getCandidateVotes,
  });

  factory GetCandidateVotesResponse.fromJson(Map<String, dynamic> json) => GetCandidateVotesResponse(
    getCandidateVotes: GetCandidateVotes.fromJson(json["getCandidateVotes"]),
  );

  Map<String, dynamic> toJson() => {
    "getCandidateVotes": getCandidateVotes.toJson(),
  };
}

class GetCandidateVotes {
  int code;
  bool error;
  String message;
  VotesCount data;

  GetCandidateVotes({
    required this.code,
    required this.error,
    required this.message,
    required this.data,
  });

  factory GetCandidateVotes.fromJson(Map<String, dynamic> json) => GetCandidateVotes(
    code: json["code"],
    error: json["error"],
    message: json["message"],
    data: VotesCount.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "error": error,
    "message": message,
    "data": data.toJson(),
  };
}

class VotesCount {
  bool active;
  String description;
  Election election;
  int id;
  String title;
  int totalVotes;
  UserAccount userAccount;
  String uuid;

  VotesCount({
    required this.active,
    required this.description,
    required this.election,
    required this.id,
    required this.title,
    required this.totalVotes,
    required this.userAccount,
    required this.uuid,
  });

  factory VotesCount.fromJson(Map<String, dynamic> json) => VotesCount(
    active: json["active"],
    description: json["description"],
    election: Election.fromJson(json["election"]),
    id: json["id"],
    title: json["title"],
    totalVotes: json["totalVotes"],
    userAccount: UserAccount.fromJson(json["userAccount"]),
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "description": description,
    "election": election.toJson(),
    "id": id,
    "title": title,
    "totalVotes": totalVotes,
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
  String firstName;
  String fullName;
  int id;
  String lastName;
  dynamic middleName;
  String password;
  String phone;
  String username;
  String uuid;

  UserAccount({
    required this.active,
    required this.email,
    required this.firstName,
    required this.fullName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.password,
    required this.phone,
    required this.username,
    required this.uuid,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    active: json["active"],
    email: json["email"],
    firstName: json["firstName"],
    fullName: json["fullName"],
    id: json["id"],
    lastName: json["lastName"],
    middleName: json["middleName"],
    password: json["password"],
    phone: json["phone"],
    username: json["username"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "email": email,
    "firstName": firstName,
    "fullName": fullName,
    "id": id,
    "lastName": lastName,
    "middleName": middleName,
    "password": password,
    "phone": phone,
    "username": username,
    "uuid": uuid,
  };
}
