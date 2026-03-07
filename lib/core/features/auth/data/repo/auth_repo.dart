import 'dart:io';
import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../../../../failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> autoSignIn({required String token});
  Future<Either<Failure, ({String token, UserModel user})>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, ({String token, UserModel user})>> register({
    required Map<String, dynamic> userData,
  });

  Future<Either<Failure, String>> uploadProfileImage({
    required String token,
    required File image,
  });

  Future<Either<Failure, UserModel>> completeInfo({
    required String token,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, bool>> deleteUser({required String token});
}
