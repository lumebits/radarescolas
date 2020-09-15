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
        .collection('symtoms')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Symptoms.fromEntity(SymptomsEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateSymptoms(Symptoms update, String uid) {
    return userDataCollection
        .doc(uid)
        .collection('symtoms')
        .doc(update.id)
        .update(update.toEntity().toDocument());
  }
}