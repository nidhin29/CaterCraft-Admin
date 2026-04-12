import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'rate') required double rate,
    @JsonKey(name: 'duration') required String duration,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'image') String? image,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);
}
