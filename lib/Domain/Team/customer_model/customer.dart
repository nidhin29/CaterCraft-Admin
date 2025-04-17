class Customer {
  String? emailIdCustomer;
  String? name;
  String? address;
  String? mobNo;
  String? idProof;
  String? password;
  int? status;

  Customer({
    this.emailIdCustomer,
    this.name,
    this.address,
    this.mobNo,
    this.idProof,
    this.password,
    this.status,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    emailIdCustomer: json['email_id_customer'] as String?,
    name: json['name'] as String?,
    address: json['address'] as String?,
    mobNo: json['mob_no'] as String?,
    idProof: json['id_proof'] as String?,
    password: json['password'] as String?,
    status: json['status'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'email_id_customer': emailIdCustomer,
    'name': name,
    'address': address,
    'mob_no': mobNo,
    'id_proof': idProof,
    'password': password,
    'status': status,
  };
}
