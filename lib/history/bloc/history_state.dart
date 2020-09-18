part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<Symptoms> symptoms;

  const HistoryLoaded([this.symptoms = const []]);

  @override
  List<Object> get props => [symptoms];

  @override
  String toString() => 'HistoryLoaded { symptoms: $symptoms }';
}

class HistoryNotLoaded extends HistoryState {}