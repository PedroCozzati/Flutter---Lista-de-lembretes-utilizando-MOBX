import 'dart:convert';

import '../../domain/entity/user.dart';

class UserModel extends UserEntity {
  final String name;
  final String pwd;

  UserModel({
    required this.name,
    required this.pwd,
  }) : super(name: name, pwd: pwd);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pwd': pwd,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      pwd: map['pwd'],
    );
  }
}
