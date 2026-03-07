import 'dart:io';
import 'auth_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../database/auth_data.dart';
import '../../../../failure/failure.dart';
import '../../../../failure/api_failure.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthData authData;
  AuthRepoImpl({required this.authData});

  @override
  Future<Either<Failure, UserModel>> autoSignIn({required String token}) async {
    try {
      var result = await authData.autoSignIn(token: token);
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
  Future<Either<Failure, ({String token, UserModel user})>> login({
    required String email,
    required String password,
  }) async {
    try {
      var result = await authData.login(email: email, password: password);
      if (result.statusCode == 200 || result.statusCode == 201) {
        var userData = result.data['data']['user'];
        return Right((
          token: result.data['data']['token'],
          user: UserModel.fromJson(userData),
        ));
      } else {
        return Left(ApiFailure(result.data["message"]));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, ({String token, UserModel user})>> register({
    required Map<String, dynamic> userData,
  }) async {
    try {
      var result = await authData.register(userData: userData);
      if (result.statusCode == 200 || result.statusCode == 201) {
        var userData = result.data['data']['user'];
        return Right((
          token: result.data['data']['token'],
          user: UserModel.fromJson(userData),
        ));
      } else {
        return Left(ApiFailure(result.data["message"]));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage({
    required String token,
    required File image,
  }) async {
    try {
      var result = await authData.uploadProfileImage(
        token: token,
        image: image,
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        return Right(result.data['profileImage']);
      } else {
        return Left(ApiFailure(result.data["message"]));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, UserModel>> completeInfo({
    required String token,
    required Map<String, dynamic> data,
  }) async {
    try {
      var result = await authData.completeInfo(token: token, data: data);
      if (result.statusCode == 200 || result.statusCode == 201) {
        UserModel userData = UserModel.fromJson(result.data);
        return Right(userData);
      } else {
        return Left(ApiFailure(result.data["message"]));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser({required String token}) async {
    try {
      var result = await authData.deleteUser(token: token);
      if (result.statusCode == 200 || result.statusCode == 204) {
        return Right(true);
      } else {
        return Left(ApiFailure(result.data["message"]));
      }
    } catch (e) {
      return Left(ApiFailure(ApiFailure.dioError(e)));
    }
  }
}
