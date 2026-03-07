import 'mutual_friend_model.dart';

class ExploreModel {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String profileImage;
  final String bio;
  final List<MutualFriendModel>? mutualFriends;

  ExploreModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.bio,
    this.mutualFriends,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'] ?? 'Username',
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
      'mutualFriends': mutualFriends != null
          ? List<dynamic>.from(mutualFriends!.map((x) => x.toJson()))
          : [],
    };
  }
}
