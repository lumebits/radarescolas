part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.role = const Role.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Role role;
  final Email email;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [role, email, password, status];

  SignUpState copyWith({
    Role role,
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return SignUpState(
      role: role ?? this.role,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
