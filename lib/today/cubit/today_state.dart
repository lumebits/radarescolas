part of 'today_cubit.dart';

class TodayState extends Equatable {
  const TodayState({
    this.fever = const FeverInput.pure(),
    this.cough = const CoughInput.pure(),
    this.breathDifficulty = const BreathDifficultyInput.pure(),
    this.status = FormzStatus.pure,
  });

  final FeverInput fever;
  final CoughInput cough;
  final BreathDifficultyInput breathDifficulty;
  final FormzStatus status;

  @override
  List<Object> get props => [fever, cough, breathDifficulty, status];

  @override
  bool get stringify => true;

  TodayState copyWith({
    FeverInput fever,
    CoughInput cough,
    BreathDifficultyInput breathDifficulty,
    FormzStatus status,
  }) {
    return TodayState(
      fever: fever ?? this.fever,
      cough: cough ?? this.cough,
      breathDifficulty: breathDifficulty ?? this.breathDifficulty,
      status: status ?? this.status,
    );
  }
}
