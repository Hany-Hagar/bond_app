import 'mutual_friend_model.dart';

class ExploreModel {
<<<<<<< HEAD
  int id;
  int? requestId;
  String firstName;
  String lastName;
  String username;
  String email;
  bool isAcountVerified;
  String profileImage;
  String createdAt;
  String updatedAt;
  String bio;
  List<MutualFriendModel> mutualFriends;
  int mutualFriendsCount;
  bool isFriend;
  bool sentFriendRequest;
  bool receivedFriendRequest;

  ExploreModel({
    required this.id,
    this.requestId,
=======
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
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
<<<<<<< HEAD
    required this.isAcountVerified,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    required this.bio,
    required this.mutualFriends,
    required this.mutualFriendsCount,
    required this.isFriend,
    required this.sentFriendRequest,
    required this.receivedFriendRequest,
  });

  factory ExploreModel.empty() {
    return ExploreModel(
      id: 0,
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      isAcountVerified: false,
      profileImage: '',
      createdAt: '',
      updatedAt: '',
      bio: '',
      mutualFriends: [],
      mutualFriendsCount: 0,
      isFriend: false,
      sentFriendRequest: false,
      receivedFriendRequest: false,
      requestId: null,
    );
  }

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
      id: json['id'],
      requestId: json['requestId'],
=======
    required this.profileImage,
    required this.bio,
    this.mutualFriends,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
      id: json['id'],
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'] ?? 'Username',
      email: json['email'],
<<<<<<< HEAD
      isAcountVerified: json['isAcountVerified'],
      profileImage: json['profileImage'] ?? '',
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
=======
      profileImage: json['profileImage'] ?? '',
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
      bio: json['bio'] ?? '',
      mutualFriends: json['mutualFriends'] != null
          ? List<MutualFriendModel>.from(
              json['mutualFriends'].map((x) => MutualFriendModel.fromJson(x)),
            )
          : [],
<<<<<<< HEAD
      mutualFriendsCount: json['mutualFriendsCount'] ?? 0,
      isFriend: json['isFriend'] ?? false,
      sentFriendRequest: json['sentFriendRequest'] ?? false,
      receivedFriendRequest: json['receivedFriendRequest'] ?? false,
    );
  }
=======
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
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
}
