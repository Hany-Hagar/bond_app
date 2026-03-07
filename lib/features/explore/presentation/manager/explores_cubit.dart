// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';

import 'explores_states.dart';
import '../../data/repo/explores_repo.dart';
import '../../data/models/explore_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/secure_storage_service.dart';

class ExploresCubit extends Cubit<ExploresStates> {
  final ExploreRepo exploreRepo;
  final SecureStorageService secure;
  ExploresCubit({required this.exploreRepo, required this.secure})
    : super(ExploreInitialState());

  static ExploresCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  List<ExploreModel> exploreUsers = [];
  List<ExploreModel> searchResults = [];
  var searchController = TextEditingController();

  Future<void> fetchExploreUsers() async {
    if (exploreUsers.isNotEmpty) {
      return;
    }
    var token = secure.cachedToken;
    emit(ExploreLoadingState());
    var result = await exploreRepo.exploreUsers(token: token!);
    result.fold(
      (failure) => emit(ExploreFailureState(message: failure.message)),
      (exploreUsers) {
        this.exploreUsers.clear();
        this.exploreUsers.addAll(exploreUsers);
        emit(ExploreSuccessState());
      },
    );
  }

  Future<void> refreshFetchExploreUsers() async {
    var token = secure.cachedToken;
    var result = await exploreRepo.exploreUsers(token: token!);
    result.fold(
      (failure) => emit(ExploreFailureState(message: failure.message)),
      (exploreUsers) {
        this.exploreUsers.clear();
        this.exploreUsers.addAll(exploreUsers);
        emit(ExploreSuccessState());
      },
    );
  }

  void clearSearch() {
    isSearching = false;
    searchResults = [];
    searchController.clear();
    emit(FriendsSearchState());
  }

  Future<void> changeSearch({required String value}) async {
    if (value.isEmpty) {
      isSearching = false;
      searchResults = [];
      emit(FriendsSearchState());
    } else {
      isSearching = true;
      await searchExploreUsers();
      emit(FriendsSearchState());
    }
  }

  Future<void> searchExploreUsers() async {
    var token = secure.cachedToken;
    emit(ExploreLoadingState());
    var result = await exploreRepo.searchExploreUsers(
      token: token!,
      query: searchController.text,
    );
    result.fold(
      (failure) => emit(ExploreFailureState(message: failure.message)),
      (exploreUsers) {
        searchResults.clear();
        searchResults.addAll(exploreUsers);
        emit(ExploreSuccessState());
      },
    );
  }

  Future<void> sendFriendRequest({required int userId}) async {
    var token = secure.cachedToken;
    emit(SendFriendRequestLoadingState());
    var result = await exploreRepo.sendFriendRequest(
      token: token!,
      userId: userId,
    );
    result.fold(
      (failure) => emit(ExploreFailureState(message: failure.message)),
      (_) => emit(SendFriendRequestSuccessState()),
    );
  }
}
