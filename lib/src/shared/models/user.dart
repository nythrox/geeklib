// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String email;
    String id;
    String password;
    String username;

    UserModel({
        this.email,
        this.id,
        this.password,
        this.username,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"] == null ? null : json["email"],
        id: json["id"] == null ? null : json["id"],
        password: json["password"] == null ? null : json["password"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "id": id == null ? null : id,
        "password": password == null ? null : password,
        "username": username == null ? null : username,
    };
}
