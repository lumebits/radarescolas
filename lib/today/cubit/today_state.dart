part of 'today_cubit.dart';

class TodayState extends Equatable {
  const TodayState({
    this.fever = const FeverInput.pure(),
    this.cough = const CoughInput.pure(),
    this.breathDifficulty = const BreathDifficultyInput.pure(),
    this.fatigue = const FatigueInput.pure(),
    this.musclePain = const MusclePainInput.pure(),
    this.smellLack = const SmellLackInput.pure(),
    this.tasteLack = const TasteLackInput.pure(),
    this.diarrhea = const DiarrheaInput.pure(),
    this.status = FormzStatus.pure,
  });

  final FeverInput fever;
  final CoughInput cough;
  final BreathDifficultyInput breathDifficulty;
  final FatigueInput fatigue;
  final MusclePainInput musclePain;
  final SmellLackInput smellLack;
  final TasteLackInput tasteLack;
  final DiarrheaInput diarrhea;
  final FormzStatus status;

  @override
  List<Object> get props => [fever, cough, breathDifficulty, fatigue, musclePain,
    smellLack, tasteLack, diarrhea, status];

  FormzInput field (String field) {
    switch (field) {
      case 'fever': return fever;
      case 'cough': return cough;
      case 'breathDifficulty': return breathDifficulty;
      case 'fatigue': return fatigue;
      case 'musclePain': return musclePain;
      case 'smellLack': return smellLack;
      case 'tasteLack': return tasteLack;
      case 'diarrhea': return diarrhea;
    }
  }

  @override
  bool get stringify => true;

  TodayState copyWith({
    FeverInput fever,
    CoughInput cough,
    BreathDifficultyInput breathDifficulty,
    FatigueInput fatigue,
    MusclePainInput musclePain,
    SmellLackInput smellLack,
    TasteLackInput tasteLack,
    DiarrheaInput diarrhea,
    FormzStatus status,
  }) {
    return TodayState(
      fever: fever ?? this.fever,
      cough: cough ?? this.cough,
      breathDifficulty: breathDifficulty ?? this.breathDifficulty,
      fatigue: fatigue ?? this.fatigue,
      musclePain: musclePain ?? this.musclePain,
      smellLack: smellLack ?? this.smellLack,
      tasteLack: tasteLack ?? this.tasteLack,
      diarrhea: diarrhea ?? this.diarrhea,
      status: status ?? this.status,
    );
  }
}
