// ignore_for_file: strict_top_level_inference

import 'dart:developer';
import 'chats_states.dart';
import '../../data/repo/chats_repo.dart';
import '../../data/models/chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/secure_storage_service.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepo chatsRepo;
  final SecureStorageService secure;

  ChatsCubit({required this.chatsRepo, required this.secure})
    : super(ChatsInitialState());
  static ChatsCubit get(context) => BlocProvider.of<ChatsCubit>(context);

  final List<ChatModel> chats = [];

  void fetchChats({required int userId}) async {
    emit(ChatsLoadingState());
    final token = await secure.getToken();
    if (token == null) {
      emit(ChatsErrorState("Authentication token not found."));
      return;
    }
    var result = await chatsRepo.fetchChats(token: token, userId: userId);
    result.fold(
      (l) {
        log("fetchChats error: ${l.toString()}");
        emit(ChatsErrorState(l.toString()));
      },
      (r) {
        chats.addAll(r);
        emit(ChatsLoadedState());
      },
    );
  }
}
