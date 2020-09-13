import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:radarescolas/authentication/authentication.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/authentication/models/role.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository)
      : assert(_authenticationRepository != null),
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void roleChanged(String value) {
    final role = Role.dirty(value);
    emit(state.copyWith(
      role: role,
      status: Formz.validate([role, state.password, state.email]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.role, email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.role, state.email, password]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signUp(
        role: state.role.value,
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
