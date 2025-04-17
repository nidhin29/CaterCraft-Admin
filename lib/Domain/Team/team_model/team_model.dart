import 'owner.dart';

class TeamModel {
  String? status;
  List<Owner>? owners;

  TeamModel({this.status, this.owners});

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    status: json['status'] as String?,
    owners:
        (json['owners'] as List<dynamic>?)
            ?.map((e) => Owner.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'owners': owners?.map((e) => e.toJson()).toList(),
  };
}
