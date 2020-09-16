import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/history/history.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
        create: (_) => HistoryBloc(
            FirebaseSymptomsRepository(), AuthenticationRepository())
          ..add(LoadHistory()),
        child: HistoryList());
  }
}
