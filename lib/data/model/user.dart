import 'dart:convert';

class User {
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });

  String id;
  String name;
  String phone;
  String email;
  String address;
  String image;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        address: json["address"] ?? "",
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "image": image,
      };
}
