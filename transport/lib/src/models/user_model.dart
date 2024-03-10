import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends JsonObject {
  @JsonKey()
  final String? id;

  @JsonKey()
  final String name;

  @JsonKey()
  final String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
