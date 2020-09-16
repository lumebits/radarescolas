import 'dart:math';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:radarescolas/app.dart';
import 'package:radarescolas/simple_bloc_observer.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // notifications
  await initNotifications(flutterLocalNotificationsPlugin);
  requestIOSPermissions(flutterLocalNotificationsPlugin);
  scheduleNotificationPeriodically(flutterLocalNotificationsPlugin,
    'Non esquezas completar o cuestionario COVID-19', Time(7, 30, 0));

  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  Intl.defaultLocale = 'gl';
  initializeDateFormatting('gl');
  await AuthenticationRepository.initialize();
  runApp(App(authenticationRepository: AuthenticationRepository()));
}