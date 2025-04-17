class Admin {
  String? name;
  String? email;

  Admin({this.name, this.email});

  factory Admin.fromJson(Map<String, dynamic> json) =>
      Admin(name: json['name'] as String?, email: json['email'] as String?);

  Map<String, dynamic> toJson() => {'name': name, 'email': email};
}
