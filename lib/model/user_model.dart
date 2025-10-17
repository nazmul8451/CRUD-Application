class UserModel {
  final String name;
  final String email;
  final int id;

  UserModel({required this.name, required this.email, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['name'],
      email: jsonData['email'],
      id: jsonData['id'],
    );
  }
}
