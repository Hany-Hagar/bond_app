import 'package:dio/dio.dart';
import '../../../../const_data/api_const_data.dart';
import '../../../../core/services/dio_service.dart';

class RequestsData {
  final DioService dioService;
  RequestsData({required this.dioService});

  Future<Response> getRequests({required String token}) async {
    try {
      final response = await dioService.get(
        url: getFriendRequestsUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> acceptFriendRequest({
    required String token,
    required int requestId,
  }) async {
    try {
      final response = await dioService.post(
        url: acceptFriendRequestUrl,
        headers: {'Authorization': 'Bearer $token'},
        data: {'requestId': requestId},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

    Future<Response> declineFriendRequest({
    required String token,
    required int requestId,
  }) async {
    try {
      final response = await dioService.post(
        url: declineFriendRequestUrl,
        headers: {'Authorization': 'Bearer $token'},
        data: {'requestId': requestId},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
