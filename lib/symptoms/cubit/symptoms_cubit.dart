import 'package:symptoms_repository/symptoms_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/symptoms/models/symptoms.dart';

part 'symptoms_state.dart';

class SymptomsCubit extends Cubit<SymptomsState> {
  SymptomsCubit(this._symptomsRepository)
      : assert(_symptomsRepository != null),
        super(const SymptomsState());

  final SymptomsRepository _symptomsRepository;


  Future<void> symptomsFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _symptomsRepository.addNewSymptoms(state.symptoms);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
