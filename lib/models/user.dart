import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int userId;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String mobile;
  final String role;

  User({this.userId, this.firstName, this.lastName, this.username, this.email, this.mobile, this.role});

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
