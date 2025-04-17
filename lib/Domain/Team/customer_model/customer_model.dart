import 'customer.dart';

class CustomerModel {
  String? status;
  List<Customer>? customers;

  CustomerModel({this.status, this.customers});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    status: json['status'] as String?,
    customers:
        (json['customers'] as List<dynamic>?)
            ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'customers': customers?.map((e) => e.toJson()).toList(),
  };
}
