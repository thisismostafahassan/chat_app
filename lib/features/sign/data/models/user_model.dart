import 'package:chat_app/features/sign/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.phone,
    required super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['password'],
      name: json['name'],
      phone: json['phoneNumber'],
      image: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': id,
      'name': name,
      'phoneNumber': phone,
      'imageUrl': image,
    };
  }
}
