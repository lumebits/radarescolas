import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/symptoms/symptoms.dart';

import 'package:symptoms_repository/symptoms_repository.dart';

class Today extends StatelessWidget {
  Today({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SymptomsCubit>(
        create: (_) => SymptomsCubit(
          context.repository<SymptomsRepository>(),
        ),
        child: SymptomsForm()
    );
  }
}