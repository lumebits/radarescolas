import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/today/today.dart';

import '../../theme.dart';

class TodayForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<TodayCubit, TodayState>(
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
            tileColor: Color.fromARGB(255, 0, 112, 174),
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
                    _CheckboxField(field: 'fever', icon: FontAwesomeIcons.thermometerFull, text: 'Febre maior de 37,5°'),
                    _CheckboxField(field: 'cough', icon: FontAwesomeIcons.headSideCough, text: 'Tose seca'),
                    _CheckboxField(field: 'breathDifficulty', icon: FontAwesomeIcons.lungsVirus, text: 'Dificultade respiratoria'),
                    Text('OUTROS SÍNTOMAS?',
                        style: TextStyle(
                            fontSize: theme.textTheme.headline5.fontSize,
                            fontWeight: FontWeight.bold)),
                    _CheckboxField(field: 'fatigue', icon: FontAwesomeIcons.solidTired, text: 'Fatiga severa (cansazo)'),
                    _CheckboxField(field: 'musclePain', icon: FontAwesomeIcons.dumbbell, text: 'Dor muscular'),
                    _CheckboxField(field: 'smellLack', icon: FontAwesomeIcons.mugHot, text: 'Falta de olfacto'),
                    _CheckboxField(field: 'tasteLack', icon: FontAwesomeIcons.pepperHot, text: 'Falta de gusto'),
                    _CheckboxField(field: 'diarrhea', icon: FontAwesomeIcons.toilet, text: 'Diarrea'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class _CheckboxField extends StatelessWidget {
  const _CheckboxField(
      {Key key,
        @required this.field,
        @required this.icon,
        @required this.text})
      : assert(field != null && icon != null && text != null),
        super(key: key);

  final String field;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayCubit, TodayState>(
        buildWhen: (previous, current) => previous.field(field) != current.field(field),
        builder: (context, state) {
          return CheckboxListTile(
            onChanged: (bool value) {
              context.bloc<TodayCubit>().fieldChanged(field, value);
            },
            title: Text(text),
            value: state.field(field).value,
            secondary: Icon(icon),
          );
        });
  }

}
