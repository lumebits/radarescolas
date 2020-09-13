import 'dart:async';
import 'package:meta/meta.dart';

/// Thrown if during the form save process if a failure occurs.
class SaveSymptomsFormFailure implements Exception {}

/// {@template symptoms_repository}
/// Repository which manages symptoms form.
/// {@endtemplate}
class SymptomsRepository {
  /// {@macro symptoms_repository}
  SymptomsRepository();

  /// Creates a new symptom form with the provided [fever], [cough],
  /// [breathDifficulty] and [date].
  ///
  /// Throws a [SaveSymptomsFormFailure] if an exception occurs.
  Future<void> save({
    @required String fever,
    @required String cough,
    @required String breathDifficulty,
  }) async {
    assert(fever != null && cough != null && breathDifficulty != null);
    try {
      //await db.save(); /// TODO: implement
    } on Exception {
      throw SaveSymptomsFormFailure();
    }
  }


}
