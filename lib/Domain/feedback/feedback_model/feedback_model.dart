import 'feedback.dart';

class FeedbackModel {
  String? status;
  List<Feedback>? feedbacks;

  FeedbackModel({this.status, this.feedbacks});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    status: json['status'] as String?,
    feedbacks:
        (json['feedbacks'] as List<dynamic>?)
            ?.map((e) => Feedback.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'feedbacks': feedbacks?.map((e) => e.toJson()).toList(),
  };
}
