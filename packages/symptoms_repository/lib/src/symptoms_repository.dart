import 'dart:async';

import 'package:symptoms_repository/symptoms_repository.dart';

abstract class SymptomsRepository {
  Future<void> addNewSymptoms(Symptoms todo);

  Future<void> deleteSymptoms(Symptoms todo);

  Stream<List<Symptoms>> symptoms();

  Future<void> updateSymptoms(Symptoms todo);
}