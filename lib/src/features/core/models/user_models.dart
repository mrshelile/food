class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;

  final String role;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.role});

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      'role': role
    };
  }
}
