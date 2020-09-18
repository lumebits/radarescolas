import 'dart:async';

import 'package:symptoms_repository/symptoms_repository.dart';

abstract class SymptomsRepository {
  Future<void> registerSymptoms(Symptoms symptoms, String uid);

  Stream<List<Symptoms>> listSymptoms(String uid);

  Future<void> updateSymptoms(Symptoms symptoms, String uid);

  Future<Symptoms> todaySymptoms(String uid);
}
