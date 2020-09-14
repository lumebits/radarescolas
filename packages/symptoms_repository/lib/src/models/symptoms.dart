import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Symptoms {
  final String id;
  final bool fever;
  final bool cough;
  final bool breathDifficulty;
  final bool fatigue;
  final bool musclePain;
  final bool smellLack;
  final bool tasteLack;
  final bool diarrhea;
  final DateTime date;

  Symptoms(String id, {this.fever = false, this.cough = false,
  this.breathDifficulty = false, this.fatigue = false, this.musclePain = false,
    this.smellLack = false, this.tasteLack = false, this.diarrhea = false, this.date})
      : this.id = id;

  Symptoms copyWith({String id, bool fever, bool cough, bool breathDifficulty, bool fatigue, DateTime date}) {
    return Symptoms(
      id ?? this.id,
      fever: fever ?? this.fever,
      cough: cough ?? this.cough,
      breathDifficulty: breathDifficulty ?? this.breathDifficulty,
      fatigue: fatigue ?? this.fatigue,
      musclePain: musclePain ?? this.musclePain,
      smellLack: smellLack ?? this.smellLack,
      tasteLack: tasteLack ?? this.tasteLack,
      diarrhea: diarrhea ?? this.diarrhea,
      date: date ?? this.date,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ fever.hashCode ^ cough.hashCode ^ breathDifficulty.hashCode
      ^ fatigue.hashCode ^ musclePain.hashCode ^ smellLack.hashCode ^ tasteLack.hashCode
      ^ diarrhea.hashCode ^ date.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Symptoms &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              fever == other.fever &&
              cough == other.cough &&
              breathDifficulty == other.breathDifficulty &&
              fatigue == other.fatigue &&
              musclePain == other.musclePain &&
              smellLack == other.smellLack &&
              tasteLack == other.tasteLack &&
              diarrhea == other.diarrhea &&
              date == other.date;

  @override
  String toString() {
    return 'Symptoms{id: $id, fever: $fever, cough: $cough, '
        'breathDifficulty: $breathDifficulty, fatigue: $fatigue,'
        'musclePain: $musclePain, smellLack: $smellLack, tasteLack: $tasteLack, '
        'diarrhea: $diarrhea, date: $date}';
  }

  SymptomsEntity toEntity() {
    return SymptomsEntity(id, fever, cough, breathDifficulty, fatigue, musclePain,
        smellLack, tasteLack, diarrhea, date);
  }

  static Symptoms fromEntity(SymptomsEntity entity) {
    return Symptoms(
      entity.id,
      fever: entity.fever ?? false,
      cough: entity.cough ?? false,
      breathDifficulty: entity.breathDifficulty ?? false,
      fatigue: entity.fatigue ?? false,
      musclePain: entity.musclePain ?? false,
      smellLack: entity.smellLack ?? false,
      tasteLack: entity.tasteLack ?? false,
      diarrhea: entity.diarrhea ?? false,
      date: entity.date ?? DateTime.now(),
    );
  }
}