import 'package:formz/formz.dart';

enum FeverValidationError { invalid }

class FeverInput extends FormzInput<bool, FeverValidationError> {
  const FeverInput.pure() : super.pure(false);

  const FeverInput.dirty([bool value = false]) : super.dirty(value);

  @override
  FeverValidationError validator(bool value) {
    return value != null ? null : FeverValidationError.invalid;
  }
}

enum CoughValidationError { invalid }

class CoughInput extends FormzInput<bool, CoughValidationError> {
  const CoughInput.pure() : super.pure(false);

  const CoughInput.dirty([bool value = false]) : super.dirty(value);

  @override
  CoughValidationError validator(bool value) {
    return value != null ? null : CoughValidationError.invalid;
  }
}

enum BreathDifficultyValidationError { invalid }

class BreathDifficultyInput
    extends FormzInput<bool, BreathDifficultyValidationError> {
  const BreathDifficultyInput.pure() : super.pure(false);

  const BreathDifficultyInput.dirty([bool value = false]) : super.dirty(value);

  @override
  BreathDifficultyValidationError validator(bool value) {
    return value != null ? null : BreathDifficultyValidationError.invalid;
  }
}
