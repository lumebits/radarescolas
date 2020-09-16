import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/today/today.dart';

class TodayForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
        child: BlocListener<TodayCubit, TodayState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Non se puido gardar, verifica a tua conexión')),
                  );
              } else if (state.status.isSubmissionSuccess) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Enquisa gardada')),
                  );
              }
            },
            child: Questionnaire()),
      ),
    );
  }
}
