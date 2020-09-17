import 'package:formz/formz.dart';

enum RoleValidationError { invalid }

class Role extends FormzInput<String, RoleValidationError> {
  const Role.pure() : super.pure('Docente');

  const Role.dirty([String value = '']) : super.dirty(value);

  @override
  RoleValidationError validator(String value) {
    return value == 'Estudante' || value == 'Docente'
        ? null
        : RoleValidationError.invalid;
  }
}
