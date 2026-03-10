import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../services/dio_service.dart';
import '../../../../../const_data/api_const_data.dart';

class AuthData {
  final DioService dioService;
  AuthData({required this.dioService});

  // auto Sign-in methods
  Future<Response> autoSignIn({required String token}) async {
    try {
      return await dioService.get(
        url: autoSignInUrl,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }

  // Sign-in methods
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      return await dioService.post(
        url: loginUrl,
        data: {"email": email, "password": password},
      );
    } catch (e) {
      rethrow;
    }
  }

  // Registration methods
  Future<Response> register({required Map<String, dynamic> userData}) async {
    // Implement sign-up logic using dio
    try {
      return await dioService.post(url: registerUrl, data: userData);
    } catch (e) {
      rethrow;
    }
  }

  // Upload profile image
  Future<Response> uploadProfileImage({
    required String token,
    required File image,
  }) async {
    try {
      // التعديل هنا: اسم المفتاح يجب أن يكون 'profile-image' ليطابق Postman
      var data = FormData.fromMap({
        "profile-image": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });
      return await dioService.post(
        url: uploadProfileImageUrl,
        data: data,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }

  // Complete info
  Future<Response> completeInfo({
    required String token,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dioService.put(
        url: completeInfoUrl,
        data: data,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }

  // Logout method
  Future<Response> deleteUser({required String token}) async {
    try {
      return await dioService.delete(
        url: deleteAccountUrl,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }
}
