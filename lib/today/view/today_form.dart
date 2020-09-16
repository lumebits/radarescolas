import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/today/today.dart';

import '../../theme.dart';

class TodayForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TodayCubit, TodayState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                    content: Text('Non se puido gardar, verifica a tua conexión')),
              );
          } else if (state.status.isSubmissionSuccess) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Enquisa gardada')),
              );
          }
        },
        child: BlocBuilder<TodayCubit, TodayState>(
            builder: (context, state) {
              if (state.loadTodayInProgress) {
                return Center(child: CircularProgressIndicator());
              } else if (state.todayCompleted) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child:
                          FlareActor(
                            'assets/otp-verification.flr',
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                            animation: 'verify-otp',
                          ),
                      ),
                      Text('Cuestionario do día feito!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: theme.textTheme.headline3.fontSize,
                            color: theme.primaryColor,
                        )
                      ),
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      child: Questionnaire(),
                    )
                );
              }
            }
            )
    );
  }
}
