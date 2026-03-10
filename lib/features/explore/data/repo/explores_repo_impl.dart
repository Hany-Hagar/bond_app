import 'explores_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/explore_model.dart';
import '../database/explores_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/failure/api_failure.dart';

class ExploreRepoImpl extends ExploreRepo {
  final ExploreData exploreUsersData;
  ExploreRepoImpl({required this.exploreUsersData});

  @override
  Future<Either<Failure, List<ExploreModel>>> exploreUsers({
    required String token,
  }) async {
    try {
      var result = await exploreUsersData.exploreUsers(token: token);
      if (result.statusCode == 200 || result.statusCode == 201) {
        var userData = result.data["data"];
        List<ExploreModel> exploreUsers = [];
        for (var user in userData) {
          exploreUsers.add(ExploreModel.fromJson(user));
        }
        return Right(exploreUsers);
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, List<ExploreModel>>> searchExploreUsers({
    required String token,
    required String query,
  }) async {
    try {
      var result = await exploreUsersData.searchExploreUsers(
        token: token,
        query: query,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        var userData = result.data["data"];
        List<ExploreModel> exploreUsers = [];
        for (var user in userData) {
          exploreUsers.add(ExploreModel.fromJson(user));
        }
        return Right(exploreUsers);
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, void>> sendFriendRequest({
    required String token,
    required int userId,
  }) async {
    try {
      var result = await exploreUsersData.sendFriendRequest(
        token: token,
        userId: userId,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        return const Right(null);
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }
<<<<<<< HEAD

    @override
  Future<Either<Failure, void>> cancleFriendRequest({
    required String token,
    required int requestId,
  }) async {
    try {
      var result = await exploreUsersData.cancelFriendRequest(
        token: token,
        requestId: requestId,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        return const Right(null);
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
}
