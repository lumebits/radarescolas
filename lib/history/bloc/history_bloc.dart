import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

part 'history_state.dart';
part 'history_event.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this.symptomsRepository, this.authenticationRepository)
      : assert(symptomsRepository != null && authenticationRepository != null),
        super(HistoryLoading());

  final SymptomsRepository symptomsRepository;

  final AuthenticationRepository authenticationRepository;

  StreamSubscription _symptomsSubscription;

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is LoadHistory) {
      yield* _mapLoadHistoryToState();
    } else if (event is HistoryUpdated) {
      yield* _mapHistoryUpdatedToState(event);
    }
  }

  Stream<HistoryState> _mapLoadHistoryToState() async* {
    _symptomsSubscription?.cancel();
    _symptomsSubscription = symptomsRepository
        .listSymptoms(authenticationRepository.currentUserId())
        .listen(
          (symptoms) => add(HistoryUpdated(symptoms)),
        );
  }

  Stream<HistoryState> _mapHistoryUpdatedToState(HistoryUpdated event) async* {
    yield HistoryLoaded(event.symptoms);
  }

  @override
  Future<void> close() {
    _symptomsSubscription?.cancel();
    return super.close();
  }
}
