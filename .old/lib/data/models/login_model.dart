class LoginModel {
  final String message;
  final String token;
  final int roles;
  final UserDataModel userDataModel;

  LoginModel({
    required this.message,
    required this.token,
    required this.roles,
    required this.userDataModel,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'token': token,
      'roles': roles,
      'userData': userDataModel.toJson(),
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] as String,
      token: json['token'] as String,
      roles: json['roles'] as int,
      userDataModel:
          UserDataModel.fromJson(json['userData'] as Map<String, dynamic>),
    );
  }
}

class UserDataModel {
  final int userId;
  final String firstName;
  final String lastName;
  final String status;

  UserDataModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'status': status,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      userId: json['user_id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      status: json['status'] as String,
    );
  }
}
