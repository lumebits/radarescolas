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

enum FatigueValidationError { invalid }

class FatigueInput extends FormzInput<bool, FatigueValidationError> {
  const FatigueInput.pure() : super.pure(false);

  const FatigueInput.dirty([bool value = false]) : super.dirty(value);

  @override
  FatigueValidationError validator(bool value) {
    return value != null ? null : FatigueValidationError.invalid;
  }
}

enum MusclePainValidationError { invalid }

class MusclePainInput extends FormzInput<bool, MusclePainValidationError> {
  const MusclePainInput.pure() : super.pure(false);

  const MusclePainInput.dirty([bool value = false]) : super.dirty(value);

  @override
  MusclePainValidationError validator(bool value) {
    return value != null ? null : MusclePainValidationError.invalid;
  }
}

enum SmellLackValidationError { invalid }

class SmellLackInput extends FormzInput<bool, SmellLackValidationError> {
  const SmellLackInput.pure() : super.pure(false);

  const SmellLackInput.dirty([bool value = false]) : super.dirty(value);

  @override
  SmellLackValidationError validator(bool value) {
    return value != null ? null : SmellLackValidationError.invalid;
  }
}

enum TasteLackValidationError { invalid }

class TasteLackInput extends FormzInput<bool, TasteLackValidationError> {
  const TasteLackInput.pure() : super.pure(false);

  const TasteLackInput.dirty([bool value = false]) : super.dirty(value);

  @override
  TasteLackValidationError validator(bool value) {
    return value != null ? null : TasteLackValidationError.invalid;
  }
}

enum DiarrheaValidationError { invalid }

class DiarrheaInput extends FormzInput<bool, DiarrheaValidationError> {
  const DiarrheaInput.pure() : super.pure(false);

  const DiarrheaInput.dirty([bool value = false]) : super.dirty(value);

  @override
  DiarrheaValidationError validator(bool value) {
    return value != null ? null : DiarrheaValidationError.invalid;
  }
}

enum ActualSymptomsValidationError { invalid }

class ActualSymptomsInput extends FormzInput<String, ActualSymptomsValidationError> {
  const ActualSymptomsInput.pure() : super.pure('');

  const ActualSymptomsInput.dirty([String value = '']) : super.dirty(value);

  @override
  ActualSymptomsValidationError validator(String value) {
    return value != null ? null : ActualSymptomsValidationError.invalid;
  }
}

enum CovidContactValidationError { invalid }

class CovidContactInput extends FormzInput<bool, CovidContactValidationError> {
  const CovidContactInput.pure() : super.pure(false);

  const CovidContactInput.dirty([bool value = false]) : super.dirty(value);

  @override
  CovidContactValidationError validator(bool value) {
    return value != null ? null : CovidContactValidationError.invalid;
  }
}

enum CovidSuspectContactValidationError { invalid }

class CovidSuspectContactInput extends FormzInput<bool, CovidSuspectContactValidationError> {
  const CovidSuspectContactInput.pure() : super.pure(false);

  const CovidSuspectContactInput.dirty([bool value = false]) : super.dirty(value);

  @override
  CovidSuspectContactValidationError validator(bool value) {
    return value != null ? null : CovidSuspectContactValidationError.invalid;
  }
}

enum CovidHomemateValidationError { invalid }

class CovidHomemateInput extends FormzInput<bool, CovidHomemateValidationError> {
  const CovidHomemateInput.pure() : super.pure(false);

  const CovidHomemateInput.dirty([bool value = false]) : super.dirty(value);

  @override
  CovidHomemateValidationError validator(bool value) {
    return value != null ? null : CovidHomemateValidationError.invalid;
  }
}

enum CovidSuspectHomemateValidationError { invalid }

class CovidSuspectHomemateInput extends FormzInput<bool, CovidSuspectHomemateValidationError> {
  const CovidSuspectHomemateInput.pure() : super.pure(false);

  const CovidSuspectHomemateInput.dirty([bool value = false]) : super.dirty(value);

  @override
  CovidSuspectHomemateValidationError validator(bool value) {
    return value != null ? null : CovidSuspectHomemateValidationError.invalid;
  }
}
