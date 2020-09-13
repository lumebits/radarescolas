import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:radarescolas/navigation/models/app_tab.dart';

part 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, AppTab> {
  NavigationBloc() : super(AppTab.today);

  @override
  Stream<AppTab> mapEventToState(NavigationEvent event) async* {
    if (event is TabTapped) {
      yield event.tab;
    }
  }
}
