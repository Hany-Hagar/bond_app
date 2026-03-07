import 'package:dartz/dartz.dart';
import '../models/chat_model.dart';
import '../../../../failure/failure.dart';

abstract class ChatsRepo {
  Future<Either<Failure, List<ChatModel>>> fetchChats({
    required String token,
    required int userId,
  });
}
