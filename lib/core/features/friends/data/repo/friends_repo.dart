import 'package:dartz/dartz.dart';
import '../models/friend_model.dart';
import '../../../../failure/failure.dart';

abstract class FriendsRepo {
  Future<Either<Failure, List<FriendModel>>> fetchFriends({
    required String token,
  });
}
