import 'package:get_it/get_it.dart';
import '../../features/requests/presentation/manager/requests_cubit.dart';
import '../services/url_service.dart';
import '../services/dio_service.dart';
import '../services/secure_storage_service.dart';
import '../features/auth/manager/auth_cubit.dart';
import '../features/auth/data/repo/auth_repo.dart';
import '../services/social_media_auth_service.dart';
import '../features/chats/data/repo/chats_repo.dart';
import '../features/auth/data/database/auth_data.dart';
import '../features/friends/manager/friends_cubit.dart';
import '../features/auth/data/repo/auth_repo_impl.dart';
import '../features/friends/data/repo/friends_repo.dart';
import '../features/chats/data/database/chats_data.dart';
import '../features/settings/manager/settings_cubit.dart';
import '../features/chats/data/repo/chats_repo_impl.dart';
import '../../features/explore/data/repo/explores_repo.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/requests/data/repo/request_repo.dart';
import '../features/friends/data/database/friends_data.dart';
import '../features/friends/data/repo/friends_repo_impl.dart';
import '../../features/profile/data/database/profile_data.dart';
import '../../features/explore/data/database/explores_data.dart';
import '../features/chats/presentation/manager/chats_cubit.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/explore/data/repo/explores_repo_impl.dart';
import '../../features/requests/data/repo/request_repo_impl.dart';
import '../../features/requests/data/database/requests_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../features/profile/presentation/manager/profile_cubit.dart';
import '../../features/explore/presentation/manager/explores_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Dio
  getIt.registerLazySingleton<DioService>(() => DioService());

  // Secure Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(getIt<FlutterSecureStorage>()),
  );
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

  // Social Media Auth And Url Launcher
  getIt.registerLazySingleton<SocialMediaAuthService>(
    () => SocialMediaAuthService(),
  );
  getIt.registerLazySingleton<UrlService>(() => UrlService());

  // Auth
  getIt.registerLazySingleton<AuthData>(
    () => AuthData(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authData: getIt<AuthData>()),
  );
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      authRepo: getIt<AuthRepo>(),
      secure: getIt<SecureStorageService>(),
    ),
  );

  // Friends
  getIt.registerLazySingleton<FriendsData>(
    () => FriendsData(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<FriendsRepo>(
    () => FriendsRepoImpl(friendsData: getIt<FriendsData>()),
  );
  getIt.registerLazySingleton<FriendsCubit>(
    () => FriendsCubit(
      friendsRepo: getIt<FriendsRepo>(),
      secure: getIt<SecureStorageService>(),
    ),
  );

  // Chats
  getIt.registerLazySingleton<ChatsData>(
    () => ChatsData(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<ChatsRepo>(
    () => ChatsRepoImpl(chatsData: getIt<ChatsData>()),
  );
  getIt.registerLazySingleton<ChatsCubit>(
    () => ChatsCubit(
      chatsRepo: getIt<ChatsRepo>(),
      secure: getIt<SecureStorageService>(),
    ),
  );

  // Explore Users

  getIt.registerLazySingleton<ExploreData>(
    () => ExploreData(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<ExploreRepo>(
    () => ExploreRepoImpl(exploreUsersData: getIt<ExploreData>()),
  );
  getIt.registerLazySingleton<ExploresCubit>(
    () => ExploresCubit(
      exploreRepo: getIt<ExploreRepo>(),
      secure: getIt<SecureStorageService>(),
    ),
  );

  // Explore Users

  getIt.registerLazySingleton<RequestsData>(
    () => RequestsData(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<RequestsRepo>(
    () => RequestsRepoImpl(requestsData: getIt<RequestsData>()),
  );
  getIt.registerLazySingleton<RequestsCubit>(
    () => RequestsCubit(
      requestRepo: getIt<RequestsRepo>(),
      secure: getIt<SecureStorageService>(),
    ),
  );

  // Profile
  getIt.registerFactory<ProfileData>(
    () => ProfileData(dioService: getIt<DioService>()),
  );
  getIt.registerFactory<ProfileRepo>(
    () => ProfileRepoImpl(profileData: getIt<ProfileData>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      profileRepo: getIt<ProfileRepo>(),
      secure: getIt<SecureStorageService>(),
    ),
  );
}
