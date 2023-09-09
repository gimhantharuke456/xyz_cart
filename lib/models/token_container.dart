import 'package:xyz_cart/models/company_model.dart';
import 'package:xyz_cart/models/user_model.dart';

class TokenContainer {
  final String accessToken;
  final String tokenType;
  final String expiresAt;
  final String dateTimeFormat;
  final User user;
  final Company company;
  final int? branchId;

  TokenContainer({
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
    required this.dateTimeFormat,
    required this.user,
    required this.company,
    this.branchId,
  });

  factory TokenContainer.fromJson(Map<String, dynamic> json) {
    return TokenContainer(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresAt: json['expires_at'],
      dateTimeFormat: json['datetime_format'],
      user: User.fromJson(json),
      company: Company.fromJson(json),
      branchId: json['branch_id'],
    );
  }
}
