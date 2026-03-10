import 'dart:developer';
import 'chats_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/chat_model.dart';
import '../database/chats_data.dart';
import '../../../../failure/failure.dart';
import '../../../../failure/api_failure.dart';
import '../../../auth/data/models/user_model.dart';

class ChatsRepoImpl extends ChatsRepo {
  final ChatsData chatsData;
  ChatsRepoImpl({required this.chatsData});

  @override
  Future<Either<Failure, List<ChatModel>>> fetchChats({
    required String token,
    required int userId,
  }) async {
    try {
      var result = await chatsData.fetchChats(token: token);
      if (result.statusCode == 200) {
        var userData = result.data;
        List<ChatModel> chats = [];

        for (var chat in userData) {
          var chatData = ChatModel.fromJson(chat);
          if (chatData.friend.id == userId) {
            var friend = UserModel.fromJson(chat["user2"]);
            chatData = chatData.copyWith(friend: friend);
          }
          chats.add(chatData);
        }
        return Right(chats);
      } else {
        log("fetchChats error: ${result.statusCode}");
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }
}
