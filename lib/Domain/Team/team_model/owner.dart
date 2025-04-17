class Owner {
  String? name;
  String? address;
  String? mobNo;
  String? emailIdOwner;
  int? status;
  String? companyName;
  dynamic licenseDocument;

  Owner({
    this.name,
    this.address,
    this.mobNo,
    this.emailIdOwner,
    this.status,
    this.companyName,
    this.licenseDocument,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    name: json['name'] as String?,
    address: json['address'] as String?,
    mobNo: json['mob_no'] as String?,
    emailIdOwner: json['email_id_owner'] as String?,
    status: json['status'] as int?,
    companyName: json['company_name'] as String?,
    licenseDocument: json['license_document'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'mob_no': mobNo,
    'email_id_owner': emailIdOwner,
    'status': status,
    'company_name': companyName,
    'license_document': licenseDocument,
  };
}
