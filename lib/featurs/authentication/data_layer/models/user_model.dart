import 'dart:convert';
import '../../domain_layer/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {

  UserModel({
    super.firstName,
    super.lastName,
    super.email,
    super.age,
    super.gender,
    super.yourStudy,
  });

  factory UserModel.fromJson(UserEntity json) => UserModel(
    firstName: json.firstName,
    lastName: json.lastName,
    email: json.email,
    age: json.age,
    gender: json.gender,
    yourStudy: json.yourStudy,
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email" : email,
    "age": age,
    "gender": gender,
    "your_study": yourStudy,
  };
}
