class MutualFriendModel {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String? profileImage;

  MutualFriendModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    this.profileImage,
  });

  factory MutualFriendModel.fromJson(Map<String, dynamic> json) {
    return MutualFriendModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'profileImage': profileImage,
    };
  }
}
