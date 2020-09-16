part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadHistory extends HistoryEvent {}

class HistoryUpdated extends HistoryEvent {
  final List<Symptoms> symptoms;

  const HistoryUpdated(this.symptoms);

  @override
  List<Object> get props => [symptoms];
}
