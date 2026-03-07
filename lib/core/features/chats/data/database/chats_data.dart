import 'package:dio/dio.dart';
import '../../../../services/dio_service.dart';
import '../../../../../const_data/api_const_data.dart';

class ChatsData {
  final DioService dioService;
  ChatsData({required this.dioService});

  Future<Response> fetchChats({required String token}) async {
    try {
      return await dioService.get(
        url: getChatsUrl,
        headers: {r'Authorization': 'Bearer $token'},
      );
    } catch (e) {
      rethrow;
    }
  }
}
