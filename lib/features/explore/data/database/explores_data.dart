import 'package:dio/dio.dart';
import '../../../../const_data/api_const_data.dart';
import '../../../../core/services/dio_service.dart';

class ExploreData {
  final DioService dioService;
  ExploreData({required this.dioService});

  Future<Response> exploreUsers({required String token}) async {
    try {
      return await dioService.post(
        url: exploreFriendsUrl,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> searchExploreUsers({
    required String token,
    required String query,
  }) async {
    try {
      return await dioService.post(
        url: exploreFriendsUrl,
        headers: {r'Authorization': 'Bearer $token'},
        data: {"query": query},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> sendFriendRequest({
    required String token,
    required int userId,
  }) async {
    try {
      return await dioService.post(
        url: sendFriendRequestUrl,
        headers: {r'Authorization': 'Bearer $token'},
        data: {"receiverId": userId},
      );
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

    Future<Response> cancelFriendRequest({
    required String token,
    required int requestId,
  }) async {
    try {
      return await dioService.post(
        url: cancelFriendRequestUrl,
        headers: {r'Authorization': 'Bearer $token'},
        data: {"requestId": requestId},
      );
    } catch (e) {
      rethrow;
    }
  }
}