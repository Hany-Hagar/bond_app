import '../../../../core/features/friends/data/models/friend_model.dart';

class RequestFriendModel {
  final int id;
  final String status;
  final bool isBlocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final FriendModel requester;
  final String? blockedBy;

  RequestFriendModel({
    required this.id,
    required this.status,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.requester,
    this.blockedBy,
  });

  factory RequestFriendModel.fromJson(Map<String, dynamic> json) {
    return RequestFriendModel(
      id: json['id'],
      status: json['status'],
      isBlocked: json['isBlocked'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      requester: FriendModel.fromJson(json['requester']),
      blockedBy: json['blockedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'isBlocked': isBlocked,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'requester': requester.toJson(),
      'blockedBy': blockedBy,
    };
  }
}
