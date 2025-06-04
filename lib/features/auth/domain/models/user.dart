import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String authToken;

  // ✅ This is the proper constructor format for json_serializable
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.authToken,
  });

  // ✅ json_serializable can now generate this method
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // ✅ And this one too
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
