import 'package:dartz/dartz.dart';
import '../models/request_friend_model.dart';
import '../../../../core/failure/failure.dart';

abstract class RequestsRepo {
  Future<Either<Failure, List<RequestFriendModel>>> fetchRequests({
    required String token,
  });

  Future<Either<Failure, void>> acceptFriendRequest({
    required String token,
    required int requestId,
  });

    Future<Either<Failure, void>> declineFriendRequest({
    required String token,
    required int requestId,
  });
}