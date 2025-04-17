class Feedback {
  String? username;
  String? service;
  String? ownername;
  String? feedback;

  Feedback({this.username, this.service, this.ownername, this.feedback});

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    username: json['username'] as String?,
    service: json['service'] as String?,
    ownername: json['ownername'] as String?,
    feedback: json['feedback'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'service': service,
    'ownername': ownername,
    'feedback': feedback,
  };
}
