class Booking {
  String? datetime;
  String? serviceItem;
  double? serviceRate;
  String? customerName;
  String? customerEmail;
  String? customerMobile;
  String? ownerName;
  String? companyName;

  Booking({
    this.datetime,
    this.serviceItem,
    this.serviceRate,
    this.customerName,
    this.customerEmail,
    this.customerMobile,
    this.ownerName,
    this.companyName,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    datetime: json['datetime'] as String?,
    serviceItem: json['service_item'] as String?,
    serviceRate: json['service_rate'] as double?,
    customerName: json['customer_name'] as String?,
    customerEmail: json['customer_email'] as String?,
    customerMobile: json['customer_mobile'] as String?,
    ownerName: json['owner_name'] as String?,
    companyName: json['company_name'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'datetime': datetime,
    'service_item': serviceItem,
    'service_rate': serviceRate,
    'customer_name': customerName,
    'customer_email': customerEmail,
    'customer_mobile': customerMobile,
    'owner_name': ownerName,
    'company_name': companyName,
  };
}
