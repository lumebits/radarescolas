part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = RadarUser.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(RadarUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final RadarUser user;

  @override
  List<Object> get props => [status, user];
}
