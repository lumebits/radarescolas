part of 'symptoms_cubit.dart';

class SymptomsState extends Equatable {
  const SymptomsState({
    this.symptoms = const Symptoms.pure(),
    this.status = FormzStatus.pure,
  });

  final Symptoms symptoms;
  final FormzStatus status;

  @override
  List<Object> get props => [symptoms, status];

  SymptomsState copyWith({
    Symptoms symptoms,
    FormzStatus status,
  }) {
    return SymptomsState(
      symptoms: symptoms ?? this.symptoms,
      status: status ?? this.status,
    );
  }
}
