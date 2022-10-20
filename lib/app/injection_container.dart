import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialfy/config/themes/cubit/theme_cubit.dart';
import 'package:socialfy/core/firebase/firebase.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/notifications/notification.dart';
import 'package:socialfy/core/notifications/notifications_handler.dart';
import 'package:socialfy/core/shared/shared_prefrences.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:socialfy/features/login/data/data_sources/login_remote_date_source.dart';
import 'package:socialfy/features/login/data/repositories/login_repository_impl.dart';
import 'package:socialfy/features/login/domain/repositories/login_repository.dart';
import 'package:socialfy/features/login/domain/usecases/login_use_case.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/post/data/datasources/post_local_data_source.dart';
import 'package:socialfy/features/post/data/datasources/post_remote_data_source.dart';
import 'package:socialfy/features/post/data/repositories/post_repository_impl.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';
import 'package:socialfy/features/post/domain/usecases/add_like_to_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/add_like_to_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/create_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/create_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/dislike_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/dislike_post_use_case.dart';
import 'package:socialfy/features/post/domain/usecases/get_images_from_gallery_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_new_feed_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_post_comments_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:socialfy/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:socialfy/features/profile/domain/repositories/profile_repository.dart';
import 'package:socialfy/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/register/data/datasources/register_remote_data_source.dart';
import 'package:socialfy/features/register/data/repositories/register_repository_impl.dart';
import 'package:socialfy/features/register/domain/repositories/register_repository.dart';
import 'package:socialfy/features/register/domain/usecases/register_use_case.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';

final sl = GetIt.instance;

Future<void> init()async{


  ///bloc

  sl.registerFactory<BottomNavigationCubit>(() => BottomNavigationCubit());
  sl.registerFactory<PostCubit>(() => PostCubit(
      deletePostUseCase: sl(),
      getImageFromGalleryUseCase: sl(),
      createPostUseCase: sl(),
      getNewsFeedUseCase: sl(),
      addLikeUseCase: sl(),
      disLikeUseCase: sl(),
    createCommentUseCase: sl(),
    deleteCommentUseCase: sl(),
    addLikeToCommentUseCase: sl(),
    disLikeCommentUseCase: sl(),
    getPostCommentUseCase: sl(),
  ));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(getProfileUseCase:  sl(),sharedPrefrencesConsumer: sl()));
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(sharedPrefrencesConsumer: sl()));

  /// data Source
  sl.registerLazySingleton<PostRemoteDataSource>(
          () => PostRemoteDataSourceImpl(fireBaseConsumer: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
          () => PostLocalDataSourceImpl());
  sl.registerLazySingleton<ProfileRemoteDataSource>(
          () => ProfileRemoteDataSourceImpl(fireBaseConsumer: sl()));


  /// Repositories

  sl.registerLazySingleton<PostRepository>(
          () => PostRepositoryImpl(networkInfo: sl(),postLocalDataSource: sl(),postRemoteDataSource: sl()));

  sl.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(networkInfo: sl(),profileRemoteDataSources: sl()));


  ///use case

  sl.registerLazySingleton<GetImageFromGalleryUseCase>(
          () => GetImageFromGalleryUseCase(postRepository: sl()));
  sl.registerLazySingleton<CreatePostUseCase>(
          () => CreatePostUseCase(postRepository: sl()));
  sl.registerLazySingleton<DeletePostUseCase>(
          () => DeletePostUseCase(postRepository: sl()));
  sl.registerLazySingleton<GetProfileUseCase>(
          () => GetProfileUseCase(profileRepository: sl()));
  sl.registerLazySingleton<GetNewsFeedUseCase>(
          () => GetNewsFeedUseCase(postRepository: sl()));
  sl.registerLazySingleton<AddLikeToPostUseCase>(
          () => AddLikeToPostUseCase(postRepository: sl()));
  sl.registerLazySingleton<DisLikePostUseCase>(
          () => DisLikePostUseCase(postRepository: sl()));
  sl.registerLazySingleton<CreateCommentUseCase>(
          () => CreateCommentUseCase(postRepository: sl()));
  sl.registerLazySingleton<GetPostCommentUseCase>(
          () => GetPostCommentUseCase(postRepository: sl()));
  sl.registerLazySingleton<DeleteCommentUseCase>(
          () => DeleteCommentUseCase(postRepository: sl()));
  sl.registerLazySingleton<AddLikeToCommentUseCase>(
          () => AddLikeToCommentUseCase(postRepository: sl()));
  sl.registerLazySingleton<DisLikeCommentUseCase>(
          () => DisLikeCommentUseCase(postRepository: sl()));

  //// core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: sl()));




  ///External

  final firebase=await Firebase.initializeApp();
  final fireBaseFireStore=FirebaseFirestore.instance;
  final fireBaseFireAuth=FirebaseAuth.instance;
  final fireBaseStorage=FirebaseStorage.instance;
  final fireBaseMessaging=FirebaseMessaging.instance;

  final sharedPreferences=await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => firebase);
  sl.registerLazySingleton(() => fireBaseFireStore);
  sl.registerLazySingleton(() => fireBaseStorage);
  sl.registerLazySingleton(() => fireBaseFireAuth);
  sl.registerLazySingleton(() => fireBaseMessaging);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => FlutterLocalNotificationsPlugin());
  sl.registerLazySingleton<FireBaseConsumer>(() => FireBaseManager(client: sl(), auth: sl(),storage: sl(),messaging: sl()));
  sl.registerLazySingleton<SharedPrefrencesConsumer>(() => SharedPrefrencesManager(sharedPreferences: sl()));
  sl.registerLazySingleton<NotificationsHandler>(() => Notifications(flutterLocalNotificationsPlugin: sl()));

}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    sl.registerFactory(() => RegisterCubit(registerUseCase: sl() ));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(registerRepository: sl()));
    sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(networkInfo: sl(),registerRemoteDataSource: sl()));
    sl.registerLazySingleton<RegisterRemoteDataSource>(() => RegisterRemoteDataSourceImpl(fireBaseConsumer: sl()));

  }

}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    sl.registerFactory(() => LoginCubit(loginUseCase:sl(),sharedPrefrencesConsumer: sl()));
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepository: sl()));
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(networkInfo: sl(),loginRemoteDataSource: sl()));
    sl.registerLazySingleton<LoginRemoteDataSource>(() =>LoginRemoteDataSourceImpl(fireBaseConsumer: sl()));
  }

}