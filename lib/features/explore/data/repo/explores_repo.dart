import 'package:dartz/dartz.dart';
import '../models/explore_model.dart';
import '../../../../core/failure/failure.dart';

abstract class ExploreRepo {
  Future<Either<Failure, List<ExploreModel>>> exploreUsers({
    required String token,
  });

  Future<Either<Failure, List<ExploreModel>>> searchExploreUsers({
    required String token,
    required String query,
  });

  Future<Either<Failure, void>> sendFriendRequest({
    required String token,
    required int userId,
  });

    Future<Either<Failure, void>> cancleFriendRequest({
    required String token,
    required int requestId,
  });
}
