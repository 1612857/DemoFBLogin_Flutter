import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

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

  User(this.id, this.email, this.name, this.dob, this.avatar, this.skills,
      this.position, this.joinDate);
//      this.department, this.favouriteColleagues);

  // User copyWith({
  //   String id,
  //   String email,
  //   String name,
  //   String dob,
  //   String avatar,
  //   String skills,
  //   String position,
  //   String joinDate,
  // }) {
  //   return User(id: id ?? this.id, email: email ?? this.email, name: name ?? this.name, dob: dob ?? this.dob, avatar: avatar ?? this.avatar, skills: skills ?? this.skills, position: position ?? this.position, joinDate: joinDate ?? this.joinDate);
  // }

  factory User.fromJson(Map<String, dynamic> json) {
    final account = _$UserFromJson(json);
    return account;
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

//// this is model for members of me
//@JsonSerializable(nullable: false)
//class Account {
//  String id;
//  String email;
//  String name;
//  String dob;
//  String avatar;
//  String tempAvatar;
//  String about;
//  @JsonKey(nullable: true)
//  Contacts contacts;
//  String skills;
//  String position;
//  String joinDate;
//  int departmentId;
//  @JsonKey(toJson: _departmentToJson, nullable: true)
//  Department department;
//  @JsonKey(toJson: _socialToJson, nullable: true)
//  Social socials;
//  bool favorite;
//
//  Account(
//      {this.id,
//      this.email,
//      this.name,
//      this.dob,
//      this.avatar,
//      this.tempAvatar,
//      this.contacts,
//      this.skills,
//      this.position,
//      this.joinDate,
//      this.departmentId,
//      this.department,
//      this.about,
//      this.socials,
//      this.favorite});
//
//  DateTime get parseJoinDate => joinDate == null ? null : DateTime.parse(joinDate);
//  DateTime get parseDOB => dob == null ? null : DateTime.parse(dob);
//  bool hasSocialConnected() {
//    return socials != null &&
//        (Utils.isNotEmpty(socials.facebook) ||
//            Utils.isNotEmpty(socials.linked) ||
//            Utils.isNotEmpty(socials.git) ||
//            Utils.isNotEmpty(socials.facebook) ||
//            Utils.isNotEmpty(socials.twitter) ||
//            Utils.isNotEmpty(socials.instagram));
//  }
//
//  Account copyWith(
//      {String id,
//      String email,
//      String name,
//      String dob,
//      String avatar,
//      String tempAvatar,
//      Contacts contacts,
//      String skills,
//      String position,
//      String joinDate,
//      int departmentId,
//      Department department,
//      String about,
//      Social socials,
//      bool favorite}) {
//    return new Account(
//        id: id ?? this.id,
//        email: email ?? this.email,
//        name: name ?? this.name,
//        dob: dob ?? this.dob,
//        avatar: avatar ?? this.avatar,
//        tempAvatar: tempAvatar ?? this.tempAvatar,
//        contacts: contacts ?? this.contacts,
//        skills: skills ?? this.skills,
//        position: position ?? this.position,
//        joinDate: joinDate ?? this.joinDate,
//        departmentId: departmentId ?? this.departmentId,
//        department: department ?? this.department,
//        about: about ?? this.about,
//        socials: socials ?? this.socials,
//        favorite: favorite ?? this.favorite);
//  }
//
//  factory Account.fromJson(Map<String, dynamic> json) {
//    final account = _$AccountFromJson(json);
//    return account;
//  }
//  Map<String, dynamic> toJson() => _$AccountToJson(this);
//}
//
//Map<String, dynamic> _socialToJson(Social social) => social.toJson();
//Map<String, dynamic> _departmentToJson(Department dept) => dept.toJson();
//
//List<Map<String, dynamic>> _accountListToJson(List<Account> users) => users.map((item) => item.toJson()).toList();
