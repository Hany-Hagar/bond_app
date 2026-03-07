import 'dart:io';
import 'emoji_model.dart';
import '../../../auth/data/models/user_model.dart';

class MessageModel {
  final int id;
  final UserModel sender;
  final DateTime createdAt;
  final DateTime? updateAt;

  final String? content;
  final String? link;

  final String? imageUrl;
  final String? imagePath;

  final File? file;

  final List<EmojiModel>? reacts;

  MessageModel({
    required this.id,
    required this.sender,
    required this.createdAt,
    this.updateAt,
    this.content,
    this.link,
    this.imageUrl,
    this.imagePath,
    this.file,
    this.reacts,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      sender: UserModel.fromJson(json['sender']),
      createdAt: DateTime.parse(json['createdAt']),
      updateAt: json['updateAt'] != null
          ? DateTime.parse(json['updateAt'])
          : null,
      content: json['content'],
      link: json['link'],
      imageUrl: json['imageUrl'],
      imagePath: json['imagePath'],
      reacts: json['reacts'] != null
          ? (json['reacts'] as List)
                .map((react) => EmojiModel.fromJson(react))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updateAt': updateAt?.toIso8601String(),
      'content': content,
      'link': link,
      'imageUrl': imageUrl,
      'imagePath': imagePath,
      'reacts': reacts?.map((react) => react.toJson()).toList(),
    };
  }
}
