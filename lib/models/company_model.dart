class Company {
  final int id;
  final String name;
  final String name2;
  final String registrationNo;
  final String description;
  final String? status;
  final String urlPrefix;
  final String styles;
  final String logo;
  final String backgroundImage;
  final int userId;
  final String? regionId;
  final String? companyEmail;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String? state;
  final String zip;
  final String country;
  final String businessAddress;
  final String contactNo;
  final int isBusinessAddressSame;
  final String typeOfBusiness;
  final String category;
  final String website;
  final String settings;
  final String vatSettings;
  final String cardSettings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String companyUrl;
  final int showCardTerminalSelection;
  final String? dojoAccountName;
  final String? dojoApiKey;
  final String? dojoSoftwareHouseId;

  Company({
    required this.id,
    required this.name,
    required this.name2,
    required this.registrationNo,
    required this.description,
    required this.urlPrefix,
    required this.styles,
    required this.logo,
    required this.backgroundImage,
    required this.userId,
    required this.addressLine1,
    required this.city,
    required this.zip,
    required this.country,
    required this.businessAddress,
    required this.contactNo,
    required this.isBusinessAddressSame,
    required this.typeOfBusiness,
    required this.category,
    required this.website,
    required this.settings,
    required this.vatSettings,
    required this.cardSettings,
    required this.createdAt,
    required this.updatedAt,
    required this.companyUrl,
    required this.showCardTerminalSelection,
    this.status,
    this.regionId,
    this.companyEmail,
    this.addressLine2,
    this.state,
    this.dojoAccountName,
    this.dojoApiKey,
    this.dojoSoftwareHouseId,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['company']['id'],
      name: json['company']['name'],
      name2: json['company']['name2'],
      registrationNo: json['company']['registration_no'],
      description: json['company']['description'],
      status: json['company']['status'],
      urlPrefix: json['company']['url_prefix'],
      styles: json['company']['styles'],
      logo: json['company']['logo'],
      backgroundImage: json['company']['background_image'],
      userId: json['company']['user_id'],
      regionId: json['company']['region_id'],
      companyEmail: json['company']['company_email'],
      addressLine1: json['company']['address_line1'],
      addressLine2: json['company']['address_line2'],
      city: json['company']['city'],
      state: json['company']['state'],
      zip: json['company']['zip'],
      country: json['company']['country'],
      businessAddress: json['company']['business_address'],
      contactNo: json['company']['contact_no'],
      isBusinessAddressSame: json['company']['is_business_address_same'],
      typeOfBusiness: json['company']['type_of_business'],
      category: json['company']['category'],
      website: json['company']['website'],
      settings: json['company']['settings'],
      vatSettings: json['company']['vat_settings'],
      cardSettings: json['company']['card_settings'],
      createdAt: DateTime.parse(json['company']['created_at']),
      updatedAt: DateTime.parse(json['company']['updated_at']),
      companyUrl: json['company']['company_url'],
      showCardTerminalSelection: json['company']
          ['show_card_terminal_selection'],
      dojoAccountName: json['company']['dojo_account_name'],
      dojoApiKey: json['company']['dojo_api_key'],
      dojoSoftwareHouseId: json['company']['dojo_software_house_id'],
    );
  }
}
