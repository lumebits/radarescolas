import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  content:
                      Text('Non se puido gardar, verifica a tua conexión')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8.0),
            _QuestionsCard(
                icon: Icons.calendar_today,
                title: 'Presentou nas últimas dúas semanas?',
                children: []),
            const SizedBox(height: 8.0),
            saveButton(),
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return BlocBuilder<TodayCubit, TodayState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status.isSubmissionInProgress
              ? const CircularProgressIndicator()
              : RaisedButton(
                  key: const Key('todayForm_save_raisedButton'),
                  child: Text('GARDAR'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: theme.primaryColor,
                  onPressed: state.status.isValidated
                      ? () => context.bloc<TodayCubit>().saveTodayForm()
                      : null,
                );
        });
  }
}

class _QuestionsCard extends StatelessWidget {
  const _QuestionsCard(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.children})
      : assert(icon != null && title != null && children != null),
        super(key: key);

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(this.icon, color: Colors.white),
            title: Text(this.title,
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          ListBody(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12.0),
                    Text('SÍNTOMAS RESPIRATORIOS?',
                        style: TextStyle(
                            fontSize: theme.textTheme.headline5.fontSize,
                            fontWeight: FontWeight.bold)),
                    feverField(),
                    coughField(),
                    breathDifficultyField()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget feverField() {
    return BlocBuilder<TodayCubit, TodayState>(
        buildWhen: (previous, current) => previous.fever != current.fever,
        builder: (context, state) {
          return CheckboxListTile(
            onChanged: (bool value) {
              context.bloc<TodayCubit>().feverChanged(value);
            },
            title: const Text('Febre maior de 37,5'),
            value: state.fever.value,
            secondary: const Icon(FontAwesomeIcons.thermometerFull),
          );
        });
  }

  Widget coughField() {
    return BlocBuilder<TodayCubit, TodayState>(
        buildWhen: (previous, current) => previous.cough != current.cough,
        builder: (context, state) {
          return CheckboxListTile(
            onChanged: (bool value) {
              context.bloc<TodayCubit>().coughChanged(value);
            },
            title: const Text('Tose seca'),
            value: state.cough.value,
            secondary: const Icon(FontAwesomeIcons.headSideCough),
          );
        });
  }

  Widget breathDifficultyField() {
    return BlocBuilder<TodayCubit, TodayState>(
        buildWhen: (previous, current) =>
            previous.breathDifficulty != current.breathDifficulty,
        builder: (context, state) {
          return CheckboxListTile(
            onChanged: (bool value) {
              context.bloc<TodayCubit>().breathDifficultyChanged(value);
            },
            title: const Text('Dificultade respiratoria'),
            value: state.breathDifficulty.value,
            secondary: const Icon(FontAwesomeIcons.lungsVirus),
          );
        });
  }
}
