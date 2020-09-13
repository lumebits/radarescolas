import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/today/models/today_models.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

part 'today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit(this.symptomsRepository)
      : assert(symptomsRepository != null),
        super(
            const TodayState()); // TODO: Initial state depending on wether the form was submitted already or not

  final SymptomsRepository symptomsRepository;

  void feverChanged(bool value) {
    final fever = FeverInput.dirty(value);
    emit(state.copyWith(
      fever: fever,
      status: Formz.validate([fever, state.cough, state.breathDifficulty]),
    ));
  }

  void coughChanged(bool value) {
    final cough = CoughInput.dirty(value);
    emit(state.copyWith(
      cough: cough,
      status: Formz.validate([state.fever, cough, state.breathDifficulty]),
    ));
  }

  void breathDifficultyChanged(bool value) {
    final breathDifficulty = BreathDifficultyInput.dirty(value);
    emit(state.copyWith(
      breathDifficulty: breathDifficulty,
      status: Formz.validate([state.fever, state.cough, breathDifficulty]),
    ));
  }

  Future<void> saveTodayForm() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await symptomsRepository.addNewSymptoms(Symptoms(null,
          fever: state.fever.value,
          cough: state.cough.value,
          breathDifficulty: state.breathDifficulty.value,
          date: DateTime.now()));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
