import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// Symptoms model
///
/// [Symptoms.empty] represents an symptoms form.
/// {@endtemplate}
class Symptoms extends Equatable {
  /// {@macro symptoms}
  const Symptoms({
    @required this.fever,
    @required this.cough,
    @required this.breathDifficulty,
              this.date
  })  : assert(fever != null),
        assert(cough != null),
        assert(breathDifficulty != null);

  /// The current user's fever symptom.
  final bool fever;

  /// The current user's cough symptom.
  final bool cough;

  /// The current user's breath difficulty symptom.
  final bool breathDifficulty;

  /// The date when the form was submitted.
  final DateTime date;

  /// Empty symptoms form.
  static const empty = Symptoms(fever: false, cough: false, breathDifficulty: false, date: null);

  @override
  List<Object> get props => [fever, cough, breathDifficulty, date];
}
