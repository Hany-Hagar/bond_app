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
<<<<<<< HEAD

    Future<Either<Failure, void>> declineFriendRequest({
    required String token,
    required int requestId,
  });
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
}
