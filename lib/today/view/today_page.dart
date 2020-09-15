import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/today/today.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

class TodayPage extends StatelessWidget {
  TodayPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodayCubit>(
        create: (_) => TodayCubit(
            FirebaseSymptomsRepository(), AuthenticationRepository()),
        child: TodayForm());
  }
}
