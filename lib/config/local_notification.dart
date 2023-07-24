import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gen_soportes/features/tickets/infrastructure/mappers/TicketResponseMapper.dart';

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

// Android

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

// IOS

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final List<DarwinNotificationCategory> darwinNotificationCategories =
    <DarwinNotificationCategory>[
  DarwinNotificationCategory(
    darwinNotificationCategoryText,
    actions: <DarwinNotificationAction>[
      DarwinNotificationAction.text(
        'text_1',
        'Action 1',
        buttonTitle: 'Send',
        placeholder: 'Placeholder',
      ),
    ],
  ),
  DarwinNotificationCategory(
    darwinNotificationCategoryPlain,
    actions: <DarwinNotificationAction>[
      DarwinNotificationAction.plain('id_1', 'Action 1'),
      DarwinNotificationAction.plain(
        'id_2',
        'Action 2 (destructive)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.destructive,
        },
      ),
      DarwinNotificationAction.plain(
        navigationActionId,
        'Action 3 (foreground)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.foreground,
        },
      ),
      DarwinNotificationAction.plain(
        'id_4',
        'Action 4 (auth required)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.authenticationRequired,
        },
      ),
    ],
    options: <DarwinNotificationCategoryOption>{
      DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
    },
  )
];

final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
  requestAlertPermission: false,
  requestBadgePermission: false,
  requestSoundPermission: false,
  onDidReceiveLocalNotification:
      (int id, String? title, String? body, String? payload) async {
    didReceiveLocalNotificationStream.add(
      ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  },
  notificationCategories: darwinNotificationCategories,
);

final InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  // iOS: initializationSettingsDarwin,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
  switch (notificationResponse.notificationResponseType) {
    case NotificationResponseType.selectedNotification:
      selectNotificationStream.add(notificationResponse.payload);
      break;
    case NotificationResponseType.selectedNotificationAction:
      if (notificationResponse.actionId == navigationActionId) {
        selectNotificationStream.add(notificationResponse.payload);
      }
      break;
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

localnotification(RemoteMessage message) async {
  const int insistFlag = 4;

  try {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  } catch (e) {
    print(e);
  }

  var ticket = TicketMapper.jsonToEntity(message.data);

  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your updated channel description',
    importance: Importance.max,
    priority: Priority.max,
    channelAction: AndroidNotificationChannelAction.createIfNotExists,
    color: const Color.fromARGB(255, 175, 170, 170),
    enableLights: true,
    additionalFlags: Int32List.fromList(<int>[insistFlag]),
  );

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    ticket.idTicket,
    ticket.descripcion,
    "Tienes un nuevo ticket por atender!",
    platformChannelSpecifics,
    payload: 'item x',
  );
}
