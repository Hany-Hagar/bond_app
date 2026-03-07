import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/features/auth/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> fetchProfile({required String token});
  Future<Either<Failure, UserModel>> updateProfile({
    required String token,
    required String firstName,
    required String lastName,
    String? username,
    String? bio,
    String? password,
  });
}