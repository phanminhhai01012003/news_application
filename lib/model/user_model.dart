class UserModel {
  late String id;
  late String userName;
  late String description;
  late DateTime dateOfBirth;
  late String phone;
  late String avatar;
  late String role;
  late String email;
  late String password;
  late String loginMethod;
  UserModel({
    required this.id,
    required this.userName,
    required this.description,
    required this.dateOfBirth,
    required this.avatar,
    required this.phone,
    required this.role,
    required this.email,
    required this.password,
    required this.loginMethod,
  });
  factory UserModel.fromMap(Map<String, dynamic> data){
    return UserModel(
      id: data['userId'] ?? "", 
      userName: data['username'] ?? "", 
      description: data['description'] ?? "", 
      dateOfBirth: DateTime.parse(data['dateOfBirth'] ?? DateTime.now().toIso8601String()), 
      avatar: data['avatar'] ?? "", 
      phone: data['phone'] ?? "",
      role: data['role'] ?? "",
      email: data['email'] ?? "", 
      password: data['password'] ?? "",
      loginMethod: data['login_method'] ?? ""
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'userId': id,
      'username': userName,
      'description': description,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'avatar': avatar,
      'phone': phone,
      'role': role,
      'email': email,
      'password': password,
      'login_method': loginMethod
    };
  }
  Map<String, dynamic> updateMap(){
    return {
      'username': userName,
      'description': description,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'avatar': avatar,
      'phone': phone
    };
  }
}