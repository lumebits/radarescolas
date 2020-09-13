import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Symptoms {
  final String id;
  final bool fever;
  final bool cough;
  final bool breathDifficulty;
  final DateTime date;

  Symptoms(String id, {this.fever = false, this.cough = false,
  this.breathDifficulty = false, this.date})
      : this.id = id;

  Symptoms copyWith({String id, bool fever, bool cough, bool breathDifficulty, DateTime date}) {
    return Symptoms(
      id ?? this.id,
      fever: fever ?? this.fever,
      cough: cough ?? this.cough,
      breathDifficulty: breathDifficulty ?? this.breathDifficulty,
      date: date ?? this.date,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ fever.hashCode ^ cough.hashCode
      ^ breathDifficulty.hashCode ^ date.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Symptoms &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              fever == other.fever &&
              cough == other.cough &&
              breathDifficulty == other.breathDifficulty &&
              date == other.date;

  @override
  String toString() {
    return 'Symptoms{id: $id, fever: $fever, cough: $cough, '
        'breathDifficulty: $breathDifficulty, date: $date}';
  }

  SymptomsEntity toEntity() {
    return SymptomsEntity(id, fever, cough, breathDifficulty, date);
  }

  static Symptoms fromEntity(SymptomsEntity entity) {
    return Symptoms(
      entity.id,
      fever: entity.fever ?? false,
      cough: entity.cough ?? false,
      breathDifficulty: entity.breathDifficulty ?? false,
      date: entity.date ?? DateTime.now(),
    );
  }
}