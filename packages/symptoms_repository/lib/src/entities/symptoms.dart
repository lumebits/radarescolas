import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SymptomsEntity extends Equatable {
  final String id;
  final bool fever;
  final bool cough;
  final bool breathDifficulty;
  final bool fatigue;
  final bool musclePain;
  final bool smellLack;
  final bool tasteLack;
  final bool diarrhea;
  final String actualSymptoms;
  final bool covidContact;
  final bool covidSuspectContact;
  final bool covidHomemate;
  final bool covidSuspectHomemate;
  final DateTime date;

  const SymptomsEntity(this.id, this.fever, this.cough, this.breathDifficulty, this.fatigue,
      this.musclePain, this.smellLack, this.tasteLack, this.diarrhea,
      this.actualSymptoms, this.covidContact, this.covidSuspectContact,
      this.covidHomemate, this.covidSuspectHomemate, this.date);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "fever": fever,
      "cough": cough,
      "breathDifficulty": breathDifficulty,
      "fatigue": fatigue,
      "musclePain": musclePain,
      "smellLack": smellLack,
      "tasteLack": tasteLack,
      "diarrhea": diarrhea,
      "actualSymptoms": actualSymptoms,
      "covidContact": covidContact,
      "covidSuspectContact": covidSuspectContact,
      "covidHomemate": covidHomemate,
      "covidSuspectHomemate": covidSuspectHomemate,
      "date": date,
    };
  }

  @override
  List<Object> get props => [id, fever, cough, breathDifficulty, fatigue, musclePain,
    smellLack, tasteLack, diarrhea, actualSymptoms, covidContact, covidSuspectContact,
    covidHomemate, covidSuspectHomemate, date];

  @override
  String toString() {
    return 'SymptomsEntity { id: $id , fever: $fever, cough: $cough, '
        'breathDifficulty: $breathDifficulty, fatigue: $fatigue, '
        'musclePain: $musclePain, smellLack: $smellLack, tasteLack: $tasteLack, '
        'diarrhea: $diarrhea, actualSymptoms: $actualSymptoms, covidContact: $covidContact, '
        'covidSuspectContact: $covidSuspectContact, covidHomemate: $covidHomemate, '
        'covidSuspectHomemate: $covidSuspectHomemate, date: $date}';
  }

  static SymptomsEntity fromJson(Map<String, Object> json) {
    return SymptomsEntity(
      json["id"] as String,
      json["fever"] as bool,
      json["cough"] as bool,
      json["breathDifficulty"] as bool,
      json["fatigue"] as bool,
      json["musclePain"] as bool,
      json["smellLack"] as bool,
      json["tasteLack"] as bool,
      json["diarrhea"] as bool,
      json["actualSymptoms"] as String,
      json["covidContact"] as bool,
      json["covidSuspectContact"] as bool,
      json["covidHomemate"] as bool,
      json["covidSuspectHomemate"] as bool,
      json["date"] as DateTime,
    );
  }

  static SymptomsEntity fromSnapshot(DocumentSnapshot snap) {
    return SymptomsEntity(
      snap.id,
      snap.get('fever'),
      snap.get('cough'),
      snap.get('breathDifficulty'),
      snap.get('fatigue'),
      snap.get('musclePain'),
      snap.get('smellLack'),
      snap.get('tasteLack'),
      snap.get('diarrhea'),
      snap.get('actualSymptoms'),
      snap.get('covidContact'),
      snap.get('covidSuspectContact'),
      snap.get('covidHomemate'),
      snap.get('covidSuspectHomemate'),
      snap.get('date'),
    );
  }

  Map<String, Object> toDocument() {
    return {
      "fever": fever,
      "cough": cough,
      "breathDifficulty": breathDifficulty,
      "fatigue": fatigue,
      "musclePain": musclePain,
      "smellLack": smellLack,
      "tasteLack": tasteLack,
      "diarrhea": diarrhea,
      "actualSymptoms": actualSymptoms,
      "covidContact": covidContact,
      "covidSuspectContact": covidSuspectContact,
      "covidHomemate": covidHomemate,
      "covidSuspectHomemate": covidSuspectHomemate,
      "date": date
    };
  }
}
