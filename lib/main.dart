import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:socialfy/app/app.dart';
import 'package:socialfy/app/bloc_observer.dart';
import 'package:socialfy/app/injection_container.dart'as di;
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   if(kDebugMode) {
//     print("Handling a background message: ${message.messageId}");
//   }
// }
void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
  // var token=await di.sl<FirebaseMessaging>().getToken();
  // FirebaseMessaging messaging=di.sl<FirebaseMessaging>();
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if(kDebugMode){
  //     print('Got a message whilst in the foreground!');
  //     print('Message data: ${message.data}');
  //   }
  //   if (message.notification != null) {
  //     if(kDebugMode) {
  //       print('Message also contained a notification: ${message.notification}');
  //     }
  //   }
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // final RemoteMessage? remoteMessage= await messaging.getInitialMessage();
  SharedPrefrencesConsumer sharedPrefrencesConsumer=di.sl<SharedPrefrencesConsumer>();
  AppStrings.userLoggedInId=await sharedPrefrencesConsumer.getData(key: AppStrings.userLoggedIn);
  AppStrings.profilePic=await sharedPrefrencesConsumer.getData(key: AppStrings.userProfilePic)??'';
  AppStrings.userName=await sharedPrefrencesConsumer.getData(key: AppStrings.userProfileUsername);
  Bloc.observer=AppBlocObserver();
  runApp(const Socialfy());
  FlutterNativeSplash.remove();
}

