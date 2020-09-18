part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class TabTapped extends NavigationEvent {
  final AppTab tab;

  const TabTapped({@required this.tab});

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'TabTapped { tab: $tab }';
}