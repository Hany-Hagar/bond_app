import '../../../../core/failure/api_failure.dart';
import 'profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/profile_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/features/auth/data/models/user_model.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileData profileData;
  ProfileRepoImpl({required this.profileData});

  @override
  Future<Either<Failure, UserModel>> fetchProfile({
    required String token,
  }) async {
    try {
      var result = await profileData.fetchProfileData(token: token);
      if (result.statusCode == 200) {
        var userData = result.data;
        return Right(UserModel.fromJson(userData));
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required String token,
    required String firstName,
    required String lastName,
    String? username,
    String? bio,
    String? password,
  }) async {
    try {
      var data = {
        "firstName": firstName,
        "lastName": lastName,
        if (username != null && username.isNotEmpty) "username": username,
        if (bio != null && bio.isNotEmpty) "bio": bio,
        if (password != null && password.isNotEmpty) "password": password,
      };
      var result = await profileData.updateProfileData(
        token: token,
        data: data,
      );
      if (result.statusCode == 200) {
        var userData = result.data;
        return Right(UserModel.fromJson(userData));
      } else {
        return Left(ApiFailure(ApiFailure.dioError(result.statusCode)));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }
}
