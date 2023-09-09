class Billing {
  final String? billingAddress;
  final String? billingCity;
  final String? billingPostalCode;
  final String? billingCountry;

  Billing({
    this.billingAddress,
    this.billingCity,
    this.billingPostalCode,
    this.billingCountry,
  });

  factory Billing.fromJson(Map<String, dynamic> json) {
    return Billing(
      billingAddress: json['billing_address'],
      billingCity: json['billing_city'],
      billingPostalCode: json['billing_postal_code'],
      billingCountry: json['billing_country'],
    );
  }
}
