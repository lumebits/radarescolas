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
    this.actualSymptoms = const ActualSymptomsInput.pure(),
    this.covidContact = const CovidContactInput.pure(),
    this.covidSuspectContact = const CovidSuspectContactInput.pure(),
    this.covidHomemate = const CovidHomemateInput.pure(),
    this.covidSuspectHomemate = const CovidSuspectHomemateInput.pure(),
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
  final ActualSymptomsInput actualSymptoms;
  final CovidContactInput covidContact;
  final CovidSuspectContactInput covidSuspectContact;
  final CovidHomemateInput covidHomemate;
  final CovidSuspectHomemateInput covidSuspectHomemate;
  final FormzStatus status;

  @override
  List<Object> get props => [fever, cough, breathDifficulty, fatigue, musclePain,
    smellLack, tasteLack, diarrhea, actualSymptoms, covidContact, covidSuspectContact,
    covidHomemate, covidSuspectHomemate, status];

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
      case 'actualSymptoms': return actualSymptoms;
      case 'covidContact': return covidContact;
      case 'covidSuspectContact': return covidSuspectContact;
      case 'covidHomemate': return covidHomemate;
      case 'covidSuspectHomemate': return covidSuspectHomemate;
    }
    return null;
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
    ActualSymptomsInput actualSymptoms,
    CovidContactInput covidContact,
    CovidSuspectContactInput covidSuspectContact,
    CovidHomemateInput covidHomemate,
    CovidSuspectHomemateInput covidSuspectHomemate,
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
      actualSymptoms: actualSymptoms ?? this.actualSymptoms,
      covidContact: covidContact ?? this.covidContact,
      covidSuspectContact: covidSuspectContact ?? this.covidSuspectContact,
      covidHomemate: covidHomemate ?? this.covidHomemate,
      covidSuspectHomemate: covidSuspectHomemate ?? this.covidSuspectHomemate,
      status: status ?? this.status,
    );
  }
}
