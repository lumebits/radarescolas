import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// User model
///
/// [RadarUser.empty] represents an unauthenticated user.
/// {@endtemplate}
class RadarUser extends Equatable {
  /// {@macro user}
  const RadarUser({
    @required this.email,
    @required this.id,
    @required this.role
  })  : assert(role != null),
        assert(email != null),
        assert(id != null);

  /// The current user's email address.
  final String email;

  /// The current user's id.
  final String id;

  /// The current user's role.
  final String role;

  /// Empty user which represents an unauthenticated user.
  static const empty = RadarUser(email: '', id: '', role: '');

  @override
  List<Object> get props => [email, id, role];
}
