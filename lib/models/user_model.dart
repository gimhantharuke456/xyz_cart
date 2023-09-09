import 'package:xyz_cart/models/billing_model.dart';
import 'package:xyz_cart/models/delivery_model.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<String> roles;
  final Billing billing;
  final Delivery delivery;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.roles,
    required this.billing,
    required this.delivery,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
      phoneNumber: json['user']['phone_number'],
      roles: List<String>.from(json['user']['roles']),
      billing: Billing.fromJson(json['user']['billing']),
      delivery: Delivery.fromJson(json['user']['delivery']),
    );
  }
}
