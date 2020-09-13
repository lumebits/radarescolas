import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/authentication/authentication.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

part 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit(this._symptomsRepository)
      : assert(_symptomsRepository != null),
        super(const TodayState());

  final SymptomsRepository _symptomsRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> saveTodayForm() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _symptomsRepository.addNewSymptoms(null);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
