import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'request_model.g.dart';

@JsonSerializable()
class Request extends JsonObject {
  @JsonKey()
  final String? id;

  @JsonKey()
  final int quote;

  @JsonKey()
  final DateTime requestedAt;

  @JsonKey()
  final String description;

  @JsonKey()
  final String src, dest;

  Request({
    required this.id,
    required this.quote,
    required this.requestedAt,
    required this.description,
    required this.src,
    required this.dest,
  });

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    throw _$RequestToJson(this);
  }
}
