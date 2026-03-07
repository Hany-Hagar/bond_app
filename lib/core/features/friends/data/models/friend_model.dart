import '../../../../../features/explore/data/models/mutual_friend_model.dart';

class FriendModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final String profileImage;
  final String bio;
  final List<MutualFriendModel> mutualFriends;

  FriendModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.bio,
    required this.mutualFriends,
  });

  factory FriendModel.loading() {
    return FriendModel(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      profileImage: '',
      bio: '',
      mutualFriends: [],
      username: '',
    );
  }

  FriendModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? password,
    String? verificationToken,
    String? resetPasswordToken,
    bool? isAcountVerified,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? bio,
    List<MutualFriendModel>? mutualFriends,
  }) {
    return FriendModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      bio: bio ?? this.bio,
      mutualFriends: mutualFriends ?? this.mutualFriends,
    );
  }

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'] ?? '',
      email: json['email'],
      profileImage: json['profileImage'] ?? '',
      bio: json['bio'] ?? '',
      mutualFriends: json['mutualFriends'] != null
          ? List<MutualFriendModel>.from(
              json['mutualFriends'].map((x) => MutualFriendModel.fromJson(x)),
            )
          : [],
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
      'bio': bio,
      'mutualFriends': mutualFriends.map((e) => e.toJson()).toList(),
    };
  }
}
