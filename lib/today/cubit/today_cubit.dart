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
      status: Formz.validate([fever, state.cough, state.breathDifficulty, state.fatigue,
        state.musclePain, state.smellLack, state.tasteLack, state.diarrhea]),
    ));
  }

  void coughChanged(bool value) {
    final cough = CoughInput.dirty(value);
    emit(state.copyWith(
      cough: cough,
      status: Formz.validate([state.fever, cough, state.breathDifficulty, state.fatigue,
        state.musclePain, state.smellLack, state.tasteLack, state.diarrhea]),
    ));
  }

  void breathDifficultyChanged(bool value) {
    final breathDifficulty = BreathDifficultyInput.dirty(value);
    emit(state.copyWith(
      breathDifficulty: breathDifficulty,
      status: Formz.validate([state.fever, state.cough, breathDifficulty, state.fatigue,
        state.musclePain, state.smellLack, state.tasteLack, state.diarrhea]),
    ));
  }

  void fatigueChanged(bool value) {
    final fatigue = FatigueInput.dirty(value);
    emit(state.copyWith(
      fatigue: fatigue,
      status: Formz.validate([state.fever, state.cough, state.breathDifficulty, fatigue,
        state.musclePain, state.smellLack, state.tasteLack, state.diarrhea]),
    ));
  }

  void musclePainChanged(bool value) {
    final musclePain = MusclePainInput.dirty(value);
    emit(state.copyWith(
      musclePain: musclePain,
      status: Formz.validate([state.fever, state.cough, state.breathDifficulty, state.fatigue,
        musclePain, state.smellLack, state.tasteLack, state.diarrhea]),
    ));
  }

  void smellLackChanged(bool value) {
    final smellLack = SmellLackInput.dirty(value);
    emit(state.copyWith(
      smellLack: smellLack,
      status: Formz.validate([state.fever, state.cough, state.breathDifficulty, state.fatigue,
        state.musclePain, smellLack, state.tasteLack, state.diarrhea]),
    ));
  }

  void tasteLackChanged(bool value) {
    final tasteLack = TasteLackInput.dirty(value);
    emit(state.copyWith(
      tasteLack: tasteLack,
      status: Formz.validate([state.fever, state.cough, state.breathDifficulty, state.fatigue,
        state.musclePain, state.smellLack, tasteLack, state.diarrhea]),
    ));
  }

  void diarrheaChanged(bool value) {
    final diarrhea = DiarrheaInput.dirty(value);
    emit(state.copyWith(
      diarrhea: diarrhea,
      status: Formz.validate([state.fever, state.cough, state.breathDifficulty, state.fatigue, state.musclePain,
        state.smellLack, state.tasteLack, diarrhea]),
    ));
  }

  void fieldChanged(String field, bool value) {
    switch (field) {
      case 'fever': feverChanged(value); break;
      case 'cough': coughChanged(value); break;
      case 'breathDifficulty': breathDifficultyChanged(value); break;
      case 'fatigue': fatigueChanged(value); break;
      case 'musclePain': musclePainChanged(value); break;
      case 'smellLack': smellLackChanged(value); break;
      case 'tasteLack': tasteLackChanged(value); break;
      case 'diarrhea': diarrheaChanged(value); break;
    }
  }

  Future<void> saveTodayForm() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await symptomsRepository.addNewSymptoms(Symptoms(null,
          fever: state.fever.value,
          cough: state.cough.value,
          breathDifficulty: state.breathDifficulty.value,
          fatigue: state.fatigue.value,
          musclePain: state.musclePain.value,
          smellLack: state.smellLack.value,
          tasteLack: state.tasteLack.value,
          diarrhea: state.diarrhea.value,
          date: DateTime.now()));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
