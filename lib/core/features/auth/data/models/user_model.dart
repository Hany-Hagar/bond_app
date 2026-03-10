class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? username;
  final String email;
  final String? password;
  final String? verificationToken;
  final String? resetPasswordToken;
  final bool? isAcountVerified;
  final String? profileImageUrl;
  final String? profileImagePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? bio;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    this.password,
    this.verificationToken,
    this.resetPasswordToken,
    this.isAcountVerified,
    this.profileImageUrl,
    this.profileImagePath,
    this.createdAt,
    this.updatedAt,
    this.bio,
  });

  factory UserModel.empty() {
    return UserModel(
      id: 0,
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      password: '',
      verificationToken: '',
      resetPasswordToken: null,
      isAcountVerified: false,
      profileImageUrl: null,
      profileImagePath: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: null,
    );
  }

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? password,
    String? verificationToken,
    String? resetPasswordToken,
    bool? isAcountVerified,
    String? profileImageUrl,
    String? profileImagePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? bio,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      password: password ?? this.password,
      verificationToken: verificationToken ?? this.verificationToken,
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
      isAcountVerified: isAcountVerified ?? this.isAcountVerified,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      verificationToken: json['verificationToken'],
      resetPasswordToken: json['resetPasswordToken'],
      isAcountVerified: json['isAcountVerified'],
      profileImageUrl: json['profileImage'],
      bio: json['bio'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bio': bio,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'password': password,
      'verificationToken': verificationToken,
      'resetPasswordToken': resetPasswordToken,
      'isAcountVerified': isAcountVerified,
      'profileImage': profileImageUrl,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
