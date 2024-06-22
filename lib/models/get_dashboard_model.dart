// To parse this JSON data, do
//
//     final getDashboardResponse = getDashboardResponseFromJson(jsonString);

import 'dart:convert';

GetDashboardResponse getDashboardResponseFromJson(String str) => GetDashboardResponse.fromJson(json.decode(str));

String getDashboardResponseToJson(GetDashboardResponse data) => json.encode(data.toJson());

class GetDashboardResponse {
  GetDashboard getDashboard;

  GetDashboardResponse({
    required this.getDashboard,
  });

  factory GetDashboardResponse.fromJson(Map<String, dynamic> json) => GetDashboardResponse(
    getDashboard: GetDashboard.fromJson(json["getDashboard"]),
  );

  Map<String, dynamic> toJson() => {
    "getDashboard": getDashboard.toJson(),
  };
}

class GetDashboard {
  int code;
  Dashboard data;
  dynamic dataList;
  bool error;
  String message;

  GetDashboard({
    required this.code,
    required this.data,
    required this.dataList,
    required this.error,
    required this.message,
  });

  factory GetDashboard.fromJson(Map<String, dynamic> json) => GetDashboard(
    code: json["code"],
    data: Dashboard.fromJson(json["data"]),
    dataList: json["dataList"],
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "dataList": dataList,
    "error": error,
    "message": message,
  };
}

class Dashboard {
  int candidates;
  int elections;
  int users;
  int votes;

  Dashboard({
    required this.candidates,
    required this.elections,
    required this.users,
    required this.votes,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    candidates: json["candidates"],
    elections: json["elections"],
    users: json["users"],
    votes: json["votes"],
  );

  Map<String, dynamic> toJson() => {
    "candidates": candidates,
    "elections": elections,
    "users": users,
    "votes": votes,
  };
}
