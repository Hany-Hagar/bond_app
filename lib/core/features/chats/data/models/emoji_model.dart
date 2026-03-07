import '../../../auth/data/models/user_model.dart';

class EmojiModel {
  final String id;
  final String emoji;
  final List<UserModel> user;
  EmojiModel({required this.id, required this.emoji, required this.user});

  factory EmojiModel.fromJson(Map<String, dynamic> json) {
    return EmojiModel(
      id: json['id'],
      emoji: json['emoji'],
      user: (json['user'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emoji': emoji,
      'user': user.map((user) => user.toJson()).toList(),
    };
  }
}
