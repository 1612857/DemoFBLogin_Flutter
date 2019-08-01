import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

// *** PLEASE RUN COMMAND BELOW FOR REBUILD MODELS ****
// flutter packages pub run build_runner build --delete-conflicting-outputs

// this is model for only my account
@JsonSerializable(nullable: false)
class User {
  final String id;
  final String email;
  final String name;
  final String dob;
  final String avatar;
  final String skills;
  final String position;
  final String joinDate;
//  @JsonKey(toJson: _branchToJson, nullable: true)
//  Department department;
//  @JsonKey(toJson: _accountListToJson, nullable: true)
//  List<Account> favouriteColleagues;

  User(
      {this.id,
      this.email,
      this.name,
      this.dob,
      this.avatar,
      this.skills,
      this.position,
      this.joinDate});
//      this.department, this.favouriteColleagues);

  User copyWith({
    String id,
    String email,
    String name,
    String dob,
    String avatar,
    String skills,
    String position,
    String joinDate,
  }) {
    return User(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        dob: dob ?? this.dob,
        avatar: avatar ?? this.avatar,
        skills: skills ?? this.skills,
        position: position ?? this.position,
        joinDate: joinDate ?? this.joinDate);
  }

  // factory User.fromJson(Map<String, dynamic> json) {
  //   final account = _$UserFromJson(json);
  //   return account;
  // }
  // Map<String, dynamic> toJson() => _$UserToJson(this);
}
