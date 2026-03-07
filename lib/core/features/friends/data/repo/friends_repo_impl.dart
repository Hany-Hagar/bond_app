import 'friends_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/friend_model.dart';
import '../database/friends_data.dart';
import '../../../../failure/failure.dart';
import '../../../../failure/api_failure.dart';

class FriendsRepoImpl extends FriendsRepo {
  final FriendsData friendsData;
  FriendsRepoImpl({required this.friendsData});

  @override
  Future<Either<Failure, List<FriendModel>>> fetchFriends({
    required String token,
  }) async {
    try {
      var result = await friendsData.fetchFriends(token: token);
      if (result.statusCode == 200) {
        var userData = result.data;
        List<FriendModel> friends = [];
        for (var friend in userData) {
          friends.add(FriendModel.fromJson(friend));
        }
        return Right(friends);
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }
}
