import 'package:dio/dio.dart';
import '../../../../services/dio_service.dart';
import '../../../../../const_data/api_const_data.dart';

class FriendsData {
  final DioService dioService;
  FriendsData({required this.dioService});

  Future<Response> fetchFriends({required String token}) async {
    try {
      return await dioService.get(
        url: getFriendsUrl,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }
}
