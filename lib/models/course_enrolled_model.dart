// To parse this JSON data, do
//
//     final courseEnrolledUsers = courseEnrolledUsersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CourseEnrolledUsers> courseEnrolledUsersFromJson(String str) =>
    List<CourseEnrolledUsers>.from(
        json.decode(str).map((x) => CourseEnrolledUsers.fromJson(x)));

String courseEnrolledUsersToJson(List<CourseEnrolledUsers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseEnrolledUsers {
  final int id;
  final String username;
  final String fullname;
  final String email;
  final String department;
  final String description;
  final int descriptionformat;
  final String profileimageurlsmall;
  final String profileimageurl;
  final List<Role> roles;
  final List<Preference> preferences;

  CourseEnrolledUsers({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.department,
    required this.description,
    required this.descriptionformat,
    required this.profileimageurlsmall,
    required this.profileimageurl,
    required this.roles,
    required this.preferences,
  });

  factory CourseEnrolledUsers.fromJson(Map<String, dynamic> json) =>
      CourseEnrolledUsers(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        department: json["department"],
        description: json["description"],
        descriptionformat: json["descriptionformat"],
        profileimageurlsmall: json["profileimageurlsmall"],
        profileimageurl: json["profileimageurl"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        preferences: json["preferences"] != null
            ? List<Preference>.from(
                json["preferences"].map((x) => Preference.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "department": department,
        "description": description,
        "descriptionformat": descriptionformat,
        "profileimageurlsmall": profileimageurlsmall,
        "profileimageurl": profileimageurl,
        "roles": List<Role>.from(roles.map((x) => x.toJson())),
        "preferences":
            List<Preference>.from(preferences.map((x) => x.toJson())),
      };
}

class Preference {
  final String name;
  final dynamic value;

  Preference({
    required this.name,
    required this.value,
  });

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Role {
  final int roleid;
  final String name;
  final String shortname;
  final int sortorder;

  Role({
    required this.roleid,
    required this.name,
    required this.shortname,
    required this.sortorder,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleid: json["roleid"],
        name: json["name"],
        shortname: json["shortname"],
        sortorder: json["sortorder"],
      );

  Map<String, dynamic> toJson() => {
        "roleid": roleid,
        "name": name,
        "shortname": shortname,
        "sortorder": sortorder,
      };
}
