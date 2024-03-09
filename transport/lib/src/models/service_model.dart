import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'service_model.g.dart';

@JsonSerializable()
class Service extends JsonObject {
  @JsonKey()
  final String? id;

  @JsonKey()
  final String description;

  @JsonKey()
  final int quote;

  Service({
    required this.id,
    required this.description,
    required this.quote,
  });

  factory Service.fromJson(Map<String, String> json) => _$ServiceFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceToJson(this);
  }
}
