import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'service_name') required String name,
    @JsonKey(name: 'rate') required num rate,
    @JsonKey(name: 'duration') String? duration,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'imageUrl') String? image,
    @JsonKey(name: 'service_group') String? serviceGroup,
    @JsonKey(name: 'menu') ServiceMenu? menu,
    @JsonKey(name: 'whats_included') List<String>? whatsIncluded,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}

@freezed
abstract class ServiceMenu with _$ServiceMenu {
  const factory ServiceMenu({
    @JsonKey(name: 'starters') List<String>? starters,
    @JsonKey(name: 'main_course') List<String>? mainCourse,
    @JsonKey(name: 'desserts') List<String>? desserts,
  }) = _ServiceMenu;

  factory ServiceMenu.fromJson(Map<String, dynamic> json) =>
      _$ServiceMenuFromJson(json);
}
