import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:symptoms_repository/symptoms_repository.dart';
import 'entities/entities.dart';

class FirebaseSymptomsRepository implements SymptomsRepository {
  final todoCollection = FirebaseFirestore.instance.collection('symptoms');

  @override
  Future<void> addNewSymptoms(Symptoms todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteSymptoms(Symptoms todo) async {
    return todoCollection.doc(todo.id).delete();
  }

  @override
  Stream<List<Symptoms>> symptoms() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Symptoms.fromEntity(SymptomsEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateSymptoms(Symptoms update) {
    return todoCollection
        .doc(update.id)
        .update(update.toEntity().toDocument());
  }
}