// To parse this JSON data, do
//
//     final getAllUsersResponse = getAllUsersResponseFromJson(jsonString);

import 'dart:convert';

GetAllUsersResponse getAllUsersResponseFromJson(String str) => GetAllUsersResponse.fromJson(json.decode(str));

String getAllUsersResponseToJson(GetAllUsersResponse data) => json.encode(data.toJson());

class GetAllUsersResponse {
  GetAllUsers getAllUsers;

  GetAllUsersResponse({
    required this.getAllUsers,
  });

  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) => GetAllUsersResponse(
    getAllUsers: GetAllUsers.fromJson(json["getAllUsers"]),
  );

  Map<String, dynamic> toJson() => {
    "getAllUsers": getAllUsers.toJson(),
  };
}

class GetAllUsers {
  List<AllUsers> content;

  GetAllUsers({
    required this.content,
  });

  factory GetAllUsers.fromJson(Map<String, dynamic> json) => GetAllUsers(
    content: List<AllUsers>.from(json["content"].map((x) => AllUsers.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class AllUsers {
  bool active;
  String email;
  String firstName;
  int? id;
  String lastName;
  dynamic middleName;
  String phone;
  String uuid;
  String username;
  String fullName;

  AllUsers({
    required this.active,
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.phone,
    required this.uuid,
    required this.username,
    required this.fullName,
  });

  factory AllUsers.fromJson(Map<String, dynamic> json) => AllUsers(
    active: json["active"],
    email: json["email"],
    firstName: json["firstName"],
    id: json["id"],
    lastName: json["lastName"],
    middleName: json["middleName"],
    phone: json["phone"],
    uuid: json["uuid"],
    username: json["username"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "email": email,
    "firstName": firstName,
    "id": id,
    "lastName": lastName,
    "middleName": middleName,
    "phone": phone,
    "uuid": uuid,
    "username": username,
    "fullName": fullName,
  };
}
