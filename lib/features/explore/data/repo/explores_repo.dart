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
<<<<<<< HEAD

    Future<Either<Failure, void>> cancleFriendRequest({
    required String token,
    required int requestId,
  });
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
}
