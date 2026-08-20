class CustomerModel {
  final String id;
  final String fullName;
  final String phone;
  final String email;

  CustomerModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone': phone,
      'email': email,
    };
  }
}