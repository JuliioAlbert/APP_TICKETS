import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gen_soportes/config/local_notification.dart';
import 'package:gen_soportes/config/notifications/local_notification.dart';
import 'package:gen_soportes/firebase_options.dart';

abstract class PushNotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  static StreamController<RemoteMessage> messageStream =
      StreamController.broadcast();

  static Stream<RemoteMessage> get messagesStream => messageStream.stream;

  //app Back del app
  @pragma('vm:entry-point')
  static Future _onMessageHandler(RemoteMessage message) async {
    await localnotification(message);
    //Message Stream
    messageStream.add(message);
  }

  // En la app
  @pragma('vm:entry-point')
  static Future _onMessageOpenHandler(RemoteMessage message) async {
    await localnotification(message);
    //Message Stream
    messageStream.add(message);
  }

  static Future initializeApp() async {
    await LocalNotification.initializeLocalNotifications();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenHandler);
  }

  static closeStreams() {
    messageStream.close();
  }
}
