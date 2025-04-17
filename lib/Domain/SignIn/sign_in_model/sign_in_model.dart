import 'admin.dart';

class SignInModel {
  String? status;
  String? message;
  Admin? admin;

  SignInModel({this.status, this.message, this.admin});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json['status'] as String?,
    message: json['message'] as String?,
    admin:
        json['admin'] == null
            ? null
            : Admin.fromJson(json['admin'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'admin': admin?.toJson(),
  };
}
