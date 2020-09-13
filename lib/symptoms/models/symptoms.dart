import 'package:formz/formz.dart';

enum SymptomsValidationError { invalid }

class Symptoms extends FormzInput<String, SymptomsValidationError> {
  const Symptoms.pure() : super.pure('');
  const Symptoms.dirty([String value = '']) : super.dirty(value);

  @override
  SymptomsValidationError validator(String value) {
    return null;
  }
}
