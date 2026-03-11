import '../../../../core/failure/api_failure.dart';
import 'request_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/requests_data.dart';
import '../models/request_friend_model.dart';
import '../../../../core/failure/failure.dart';

class RequestsRepoImpl extends RequestsRepo {
  final RequestsData requestsData;
  RequestsRepoImpl({required this.requestsData});

  @override
  Future<Either<Failure, List<RequestFriendModel>>> fetchRequests({
    required String token,
  }) async {
    try {
      var result = await requestsData.getRequests(token: token);
      if (result.statusCode == 200 || result.statusCode == 201) {
        var userData = result.data;
        List<RequestFriendModel> exploreUsers = [];
        for (var user in userData) {
          exploreUsers.add(RequestFriendModel.fromJson(user));
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
  Future<Either<Failure, void>> acceptFriendRequest({
    required String token,
    required int requestId,
  }) async {
    try {
      var result = await requestsData.acceptFriendRequest(
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

    @override
  Future<Either<Failure, void>> declineFriendRequest({
    required String token,
    required int requestId,
  }) async {
    try {
      var result = await requestsData.declineFriendRequest(
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
}