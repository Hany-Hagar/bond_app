import 'mutual_friend_model.dart';

class ExploreModel {
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
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
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
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'] ?? 'Username',
      email: json['email'],
      isAcountVerified: json['isAcountVerified'],
      profileImage: json['profileImage'] ?? '',
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      bio: json['bio'] ?? '',
      mutualFriends: json['mutualFriends'] != null
          ? List<MutualFriendModel>.from(
              json['mutualFriends'].map((x) => MutualFriendModel.fromJson(x)),
            )
          : [],
      mutualFriendsCount: json['mutualFriendsCount'] ?? 0,
      isFriend: json['isFriend'] ?? false,
      sentFriendRequest: json['sentFriendRequest'] ?? false,
      receivedFriendRequest: json['receivedFriendRequest'] ?? false,
    );
  }
}