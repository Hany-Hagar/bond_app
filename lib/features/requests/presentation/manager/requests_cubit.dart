// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';

import 'requests_states.dart';
import '../../data/repo/request_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/request_friend_model.dart';
import '../../../../core/services/secure_storage_service.dart';

class RequestsCubit extends Cubit<RequestsStates> {
  final RequestsRepo requestRepo;
  final SecureStorageService secure;
  RequestsCubit({required this.requestRepo, required this.secure})
    : super(RequestsInitialState());
  static RequestsCubit get(context) => BlocProvider.of(context);

<<<<<<< HEAD
  bool isFirstLoad = true;
=======
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
  bool isSearching = false;
  List<RequestFriendModel> requests = [];
  List<RequestFriendModel> searchResults = [];
  var searchController = TextEditingController();

  Future<void> fetchRequests() async {
<<<<<<< HEAD
    if (isFirstLoad) {
      isFirstLoad = false;
    } else {
      refreshFetchRequests();
=======
    if (requests.isNotEmpty) {
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
      return;
    }
    emit(RequestsLoadingState());
    var token = secure.cachedToken;
    var data = await requestRepo.fetchRequests(token: token!);
    data.fold((l) => emit(RequestsFailureState(message: l.toString())), (r) {
      requests = r;
      emit(RequestsSuccessState());
    });
  }

  Future<void> refreshFetchRequests() async {
    var token = secure.cachedToken;
    var data = await requestRepo.fetchRequests(token: token!);
    data.fold((l) => emit(RequestsFailureState(message: l.toString())), (r) {
      requests = r;
      emit(RequestsSuccessState());
    });
  }

  void clearSearch() {
    isSearching = false;
    searchResults = [];
    searchController.clear();
    emit(RequestsSearchState());
  }

  void changeSearch({required String value}) {
    if (value.isEmpty) {
      isSearching = false;
      searchResults = [];
      emit(RequestsSearchState());
    } else {
      isSearching = true;
      searchResults = requests
          .where(
            (request) => request.requester.username.toLowerCase().contains(
              value.toLowerCase(),
            ),
          )
          .toList();
      emit(RequestsSearchState());
    }
  }

  void acceptFriendRequest({required int requestId}) async {
<<<<<<< HEAD
    emit(AcceptRequestLoadingState(requestId: requestId));
=======
    emit(AcceptRequestLoadingState());
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
    var token = secure.cachedToken;
    var data = await requestRepo.acceptFriendRequest(
      token: token!,
      requestId: requestId,
    );
<<<<<<< HEAD
    data.fold((l) => emit(RequestsFailureState(message: l.toString())), (r) {
      emit(AcceptRequestSuccessState());
      refreshFetchRequests();
    });
  }

  void declineFriendRequest({required int requestId}) async {
    emit(DeclineRequestLoadingState(requestId: requestId));
    var token = secure.cachedToken;
    var data = await requestRepo.declineFriendRequest(
      token: token!,
      requestId: requestId,
    );
    data.fold((l) => emit(RequestsFailureState(message: l.toString())), (r) {
      requests.removeWhere((request) => request.id == requestId);
      emit(DeclineRequestSuccessState());
    });
  }


=======
    data.fold(
      (l) => emit(RequestsFailureState(message: l.toString())),
      (r) => emit(AcceptRequestSuccessState()),
    );
  }
>>>>>>> b3a0b21b6298c6a0b8e0c04d5c582bb566b51f3f
}
