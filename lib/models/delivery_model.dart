class Delivery {
  final String? deliveryAddress;
  final String? deliveryCity;
  final String? deliveryCountry;
  final String? deliveryPostalCode;

  Delivery({
    this.deliveryAddress,
    this.deliveryCity,
    this.deliveryCountry,
    this.deliveryPostalCode,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      deliveryAddress: json['delivery_address'],
      deliveryCity: json['delivery_city'],
      deliveryCountry: json['delivery_country'],
      deliveryPostalCode: json['delivery_postal_code'],
    );
  }
}
