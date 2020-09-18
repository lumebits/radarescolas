import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

import 'entities/entities.dart';

class FirebaseSymptomsRepository implements SymptomsRepository {
  final userDataCollection = FirebaseFirestore.instance.collection('userData');

  @override
  Future<void> registerSymptoms(Symptoms symptoms, String uid) {
    return userDataCollection
        .doc(uid)
        .collection('symptoms')
        .add(symptoms.toEntity().toDocument());
  }

  @override
  Stream<List<Symptoms>> listSymptoms(String uid) {
    return userDataCollection
        .doc(uid)
        .collection('symptoms')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Symptoms.fromEntity(SymptomsEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Future<Symptoms> todaySymptoms(String uid) {
    DateTime now = new DateTime.now();
    DateTime today = new DateTime(now.year, now.month, now.day);
    return userDataCollection
        .doc(uid)
        .collection('symptoms')
        .where('date', isGreaterThanOrEqualTo: today)
        .orderBy('date', descending: true)
        .snapshots()
        .first
        .asStream()
        .map((snapshot) => Symptoms.fromEntity(
            SymptomsEntity.fromSnapshot(snapshot.docs.first)))
        .first;
  }

  @override
  Future<void> updateSymptoms(Symptoms update, String uid) {
    return userDataCollection
        .doc(uid)
        .collection('symptoms')
        .doc(update.id)
        .update(update.toEntity().toDocument());
  }
}
