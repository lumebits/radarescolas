import 'package:formz/formz.dart';

enum RoleValidationError { invalid }

class Role extends FormzInput<String, RoleValidationError> {
  const Role.pure() : super.pure('Mestre/a');
  const Role.dirty([String value = '']) : super.dirty(value);

  @override
  RoleValidationError validator(String value) {
    return value == 'Alumno/a' || value == 'Mestre/a' ? null : RoleValidationError.invalid;
  }
}
