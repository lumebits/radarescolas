import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:radarescolas/app.dart';
import 'package:radarescolas/simple_bloc_observer.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  Intl.defaultLocale = 'gl';
  initializeDateFormatting('gl');
  await AuthenticationRepository.initialize();
  runApp(App(authenticationRepository: AuthenticationRepository()));
}
