part of 'today_cubit.dart';

class TodayState extends Equatable {
  const TodayState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [email, password, status];

  TodayState copyWith({
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return TodayState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
