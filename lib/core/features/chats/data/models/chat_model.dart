import '../../../auth/data/models/user_model.dart';

class ChatModel {
  final int id;
  final String type;
  final String roomId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserModel friend;
  //final List<MessageModel> messages;
  ChatModel({
    required this.id,
    required this.type,
    required this.roomId,
    required this.createdAt,
    required this.updatedAt,
    required this.friend,
    //required this.messages,
  });

  ChatModel copyWith({
    int? id,
    String? type,
    String? roomId,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserModel? friend,
    // List<MessageModel>? messages,
  }) {
    return ChatModel(
      id: id ?? this.id,
      type: type ?? this.type,
      roomId: roomId ?? this.roomId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      friend: friend ?? this.friend,
      //group: group ?? this.group,
      //messages: messages ?? this.messages,
    );
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      type: json['type'],
      roomId: json['roomId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      friend: UserModel.fromJson(json['user1']),
      // messages: (json['messages'])
      //     .map((message) => MessageModel.fromJson(message))
      //     .toList(),
    );
  }
}
