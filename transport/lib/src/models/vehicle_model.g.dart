// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      vehicleNumber: json['vehicleNumber'] as String?,
      driverName: json['driverName'] as String,
      vehicleCapacity: json['vehicleCapacity'] as int,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'vehicleNumber': instance.vehicleNumber,
      'driverName': instance.driverName,
      'vehicleCapacity': instance.vehicleCapacity,
    };
