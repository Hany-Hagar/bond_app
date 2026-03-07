// ignore_for_file: strict_top_level_inference

import 'dart:developer';
import 'friends_states.dart';
import 'package:flutter/material.dart';
import '../data/repo/friends_repo.dart';
import '../data/models/friend_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/secure_storage_service.dart';

class FriendsCubit extends Cubit<FriendsStates> {
  final FriendsRepo friendsRepo;
  final SecureStorageService secure;
  FriendsCubit({required this.friendsRepo, required this.secure})
    : super(FriendsInitialState());

  static FriendsCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  List<FriendModel> friends = [];
  List<FriendModel> searchResults = [];
  var searchController = TextEditingController();

  void fetchFriends() async {
    emit(FriendsLoadingState());
    var token = secure.cachedToken;
    var result = await friendsRepo.fetchFriends(token: token!);
    result.fold((l) => emit(FriendsErrorState(l.message)), (r) {
      friends.clear();
      friends = r;
      emit(FriendsSuccessState());
    });
  }

  void refreshfetchFriends() async {
    var token = secure.cachedToken;
    var result = await friendsRepo.fetchFriends(token: token!);
    result.fold((l) => emit(FriendsErrorState(l.message)), (r) {
      friends.clear();
      friends = r;
      emit(FriendsSuccessState());
    });
  }

  void clearSearch() {
    isSearching = false;
    searchResults = [];
    searchController.clear();
    emit(FriendsSearchState());
  }

  void changeSearch({required String value}) {
    log(value);
    if (value.isEmpty) {
      isSearching = false;
      searchResults = [];
      emit(FriendsSearchState());
    } else {
      isSearching = true;
      searchResults = friends
          .where(
            (friend) =>
                friend.username.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
      emit(FriendsSearchState());
    }
  }
}
