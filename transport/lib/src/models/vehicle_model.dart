import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class Vehicle extends JsonObject {
  @JsonKey()
  final String? vehicleNumber;

  @JsonKey()
  final String driverName;

  @JsonKey()
  final int vehicleCapacity;

  Vehicle({
    required this.vehicleNumber,
    required this.driverName,
    required this.vehicleCapacity,
  });

  factory Vehicle.fromJson(Map<String, String> json) => _$VehicleFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$VehicleToJson(this);
  }
}
