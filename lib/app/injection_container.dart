import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialfy/features/login/data/datasources/login_local_data_source.dart';
import 'package:socialfy/features/login/data/datasources/login_remote_date_source.dart';
import 'package:socialfy/features/messenger/data/datasources/chat_remote_data_source.dart';
import 'package:socialfy/features/messenger/data/repositories/chat_repository_impl.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';
import 'package:socialfy/features/messenger/domain/usecases/create_chat_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_chat_messages_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_user_chats_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_users_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/send_message_usecase.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_cubit.dart';
import 'package:socialfy/features/post/data/datasources/local/gallery_data_source.dart';
import 'package:socialfy/features/post/data/datasources/remote/comment_remote_data_source.dart';
import 'package:socialfy/features/post/data/repositories/comment_repository_impl.dart';
import 'package:socialfy/features/post/data/repositories/gallery_repository_impl.dart';
import 'package:socialfy/features/post/domain/repositories/comment_repository.dart';
import 'package:socialfy/features/post/domain/repositories/gallery_repository.dart';
import 'package:socialfy/features/post/domain/usecases/get_album_images_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/create_comment_cubit/create_comment_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/delete_comment_cubit/delete_comment_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_comment_cubit/like_comment_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_cubit.dart';
import 'package:socialfy/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:socialfy/features/settings/data/datasources/theme_local_datasource/theme_local_datasource.dart';
import 'package:socialfy/features/settings/data/repositories/theme_repository_impl.dart';
import 'package:socialfy/features/settings/domain/repositories/theme_repository.dart';
import 'package:socialfy/features/settings/domain/usecases/change_theme_usecase.dart';
import 'package:socialfy/features/settings/domain/usecases/get_theme_usecase.dart';
import 'package:socialfy/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:socialfy/core/firebase/firebase.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/shared/shared_prefrences.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/features/login/data/repositories/login_repository_impl.dart';
import 'package:socialfy/features/login/domain/repositories/login_repository.dart';
import 'package:socialfy/features/login/domain/usecases/login_use_case.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/post/data/datasources/remote/post_remote_data_source.dart';
import 'package:socialfy/features/post/data/repositories/post_repository_impl.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';
import 'package:socialfy/features/post/domain/usecases/like_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/add_like_to_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/create_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/create_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_gallery_albums_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_post_comments_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/delete_post_cubit/delete_post_cubit.dart';
import 'package:socialfy/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:socialfy/features/profile/domain/repositories/profile_repository.dart';
import 'package:socialfy/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:socialfy/features/register/data/datasources/register_remote_data_source.dart';
import 'package:socialfy/features/register/data/repositories/register_repository_impl.dart';
import 'package:socialfy/features/register/domain/repositories/register_repository.dart';
import 'package:socialfy/features/register/domain/usecases/register_use_case.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';

final sl = GetIt.instance;

Future<void> init()async{


  ///bloc

  sl.registerFactory<DeletePostCubit>(() => DeletePostCubit(sl()));
  sl.registerFactory<DeleteCommentCubit>(() => DeleteCommentCubit(sl()));
  sl.registerFactory<CreatePostCubit>(() => CreatePostCubit(sl()));
  sl.registerFactory<GetCommentsCubit>(() => GetCommentsCubit(sl()));
  sl.registerFactory<LikeCommentCubit>(() => LikeCommentCubit(sl()));
  sl.registerFactory<LikePostCubit>(() => LikePostCubit(sl()));
  sl.registerFactory<CreateCommentCubit>(() => CreateCommentCubit(sl()));
  sl.registerFactory<GetGalleryCubit>(() => GetGalleryCubit(sl(),sl()));
  sl.registerFactory<GetPostsCubit>(() => GetPostsCubit(sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(getProfileUseCase:  sl(),sharedPrefrencesConsumer: sl()));
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(sl(),sl()));
  sl.registerFactory<GetAllUsersCubit>(() => GetAllUsersCubit(sl(),sl()));
  sl.registerFactory<ChatCubit>(() => ChatCubit(sl(),sl(),sl()));

  /// data Source
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CommentRemoteDataSource>(() => CommentRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GalleryLocalDataSource>(() => GalleryLocalDataSourceImpl());
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ThemeLocalDataSource>(() => ThemeLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSourceImpl(sl()));
  /// Repositories
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<GalleryRepository>(() => GalleryRepositoryImpl(sl()));
  sl.registerLazySingleton<CommentRepository>(() => CommentRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl( sl(),sl()));
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(sl()));
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl(),sl()));
  ///use case

  sl.registerLazySingleton<GetGalleryAlbumsUseCase>(() => GetGalleryAlbumsUseCase(sl()));
  sl.registerLazySingleton<GetAlbumImagesUseCase>(() => GetAlbumImagesUseCase(sl()));
  sl.registerLazySingleton<CreatePostUseCase>(() => CreatePostUseCase(postRepository: sl()));
  sl.registerLazySingleton<DeletePostUseCase>(() => DeletePostUseCase(postRepository: sl()));
  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(sl()));
  sl.registerLazySingleton<LikePostUseCase>(() => LikePostUseCase(postRepository: sl()));
  sl.registerLazySingleton<CreateCommentUseCase>(() => CreateCommentUseCase(sl()));
  sl.registerLazySingleton<GetPostCommentUseCase>(() => GetPostCommentUseCase(sl()));
  sl.registerLazySingleton<DeleteCommentUseCase>(() => DeleteCommentUseCase(sl()));
  sl.registerLazySingleton<LikeCommentUseCase>(() => LikeCommentUseCase(sl()));
  sl.registerLazySingleton<ChangeThemeUseCase>(() => ChangeThemeUseCase(sl()));
  sl.registerLazySingleton<GetThemeUseCase>(() => GetThemeUseCase(sl()));
  sl.registerLazySingleton<GetAllUsersUsecase>(() => GetAllUsersUsecase(sl()));
  sl.registerLazySingleton<GetChatMessagesUseCase>(() => GetChatMessagesUseCase(sl()));
  sl.registerLazySingleton<GetUserChatsUseCase>(() => GetUserChatsUseCase(sl()));
  sl.registerLazySingleton<CreateChatUseCase>(() => CreateChatUseCase(sl()));
  sl.registerLazySingleton<SendMessageUseCase>(() => SendMessageUseCase(sl()));



  //// core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: sl()));




  ///External

  final firebase=await Firebase.initializeApp();
  final fireBaseFireStore=FirebaseFirestore.instance;
  final fireBaseFireAuth=FirebaseAuth.instance;
  final fireBaseStorage=FirebaseStorage.instance;
  // final fireBaseMessaging=FirebaseMessaging.instance;

  final sharedPreferences=await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => firebase);
  sl.registerLazySingleton(() => fireBaseFireStore);
  sl.registerLazySingleton(() => fireBaseStorage);
  sl.registerLazySingleton(() => fireBaseFireAuth);
  // sl.registerLazySingleton(() => fireBaseMessaging);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => FlutterLocalNotificationsPlugin());
  sl.registerLazySingleton<FireBaseConsumer>(() => FireBaseManager(sl(),sl(),sl(),
      // messaging: sl()
  ));
  sl.registerLazySingleton<SharedPrefrencesConsumer>(() => SharedPrefrencesManager(sl()));
  // sl.registerLazySingleton<NotificationsHandler>(() => Notifications(flutterLocalNotificationsPlugin: sl()));

}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl(),sl()));
    sl.registerLazySingleton<RegisterRemoteDataSource>(() => RegisterRemoteDataSourceImpl(sl()));

  }

}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepository: sl()));
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl(),sl(),sl()));
    sl.registerLazySingleton<LoginRemoteDataSource>(() =>LoginRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<LoginLocalDataSource>(() =>LoginLocalDataSourceImpl(sl()));
  }
}