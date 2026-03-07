import 'package:dio/dio.dart';
import '../../../../const_data/api_const_data.dart';
import '../../../../core/services/dio_service.dart';

class ProfileData {
  final DioService dioService;
  ProfileData({required this.dioService});

  Future<Response> fetchProfileData({required String token}) async {
    try {
      return await dioService.get(
        url: getProfile,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateProfileData({required String token, required Map data}) async {
    try {
      return await dioService.put(
        url: updateProfile,
        data: data,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }
}
