import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/today/today.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

import '../../theme.dart';

class Questionnaire extends StatelessWidget {
  const Questionnaire({Key key, this.symptoms, this.readOnly = false})
      : super(key: key);

  final Symptoms symptoms;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8.0,
      alignment: WrapAlignment.center,
      children: [
        _QuestionsCard(
            icon: Icons.calendar_today,
            title: 'Presentou nas últimas dúas semanas?',
            readOnly: readOnly,
            children: [
              const SizedBox(height: 12.0),
              Text('SÍNTOMAS RESPIRATORIOS?',
                  style: TextStyle(
                      fontSize: theme.textTheme.headline5.fontSize,
                      fontWeight: FontWeight.bold,
                      color: readOnly
                          ? Theme.of(context).disabledColor
                          : Colors.black)),
              _CheckboxField(
                  field: 'fever',
                  icon: FontAwesomeIcons.thermometerFull,
                  text: 'Febre maior de 37,5°',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.fever : null),
              _CheckboxField(
                  field: 'cough',
                  icon: FontAwesomeIcons.headSideCough,
                  text: 'Tose seca',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.cough : null),
              _CheckboxField(
                  field: 'breathDifficulty',
                  icon: FontAwesomeIcons.lungsVirus,
                  text: 'Dificultade respiratoria',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.breathDifficulty : null),
              Text('OUTROS SÍNTOMAS?',
                  style: TextStyle(
                      fontSize: theme.textTheme.headline5.fontSize,
                      fontWeight: FontWeight.bold,
                      color: readOnly
                          ? Theme.of(context).disabledColor
                          : Colors.black)),
              _CheckboxField(
                  field: 'fatigue',
                  icon: FontAwesomeIcons.solidTired,
                  text: 'Fatiga severa (cansazo)',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.fatigue : null),
              _CheckboxField(
                  field: 'musclePain',
                  icon: FontAwesomeIcons.dumbbell,
                  text: 'Dor muscular',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.musclePain : null),
              _CheckboxField(
                  field: 'smellLack',
                  icon: FontAwesomeIcons.mugHot,
                  text: 'Falta de olfacto',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.smellLack : null),
              _CheckboxField(
                  field: 'tasteLack',
                  icon: FontAwesomeIcons.pepperHot,
                  text: 'Falta de gusto',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.tasteLack : null),
              _CheckboxField(
                  field: 'diarrhea',
                  icon: FontAwesomeIcons.toilet,
                  text: 'Diarrea',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.diarrhea : null),
            ]),
        _QuestionsCard(
            icon: FontAwesomeIcons.headSideVirus,
            title: 'Ten actualmente algún dos síntomas?',
            readOnly: readOnly,
            children: [
              _FreetextField(
                  field: 'actualSymptoms',
                  text: 'Sinalar cales e cando comezaron',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.actualSymptoms : null)
            ]),
        _QuestionsCard(
            icon: FontAwesomeIcons.users,
            title: 'Tivo contacto nas últimas 2 semanas?',
            readOnly: readOnly,
            children: [
              _CheckboxField(
                  field: 'covidContact',
                  icon: FontAwesomeIcons.virus,
                  text: 'Cunha persoa COVID-19+ confirmado',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.covidContact : null),
              _CheckboxField(
                  field: 'covidSuspectContact',
                  icon: FontAwesomeIcons.headSideMask,
                  text:
                      'Cunha persoa en illamento por sospeita de infección pola COVID-19',
                  readOnly: readOnly,
                  value:
                      symptoms != null ? symptoms.covidSuspectContact : null),
            ]),
        _QuestionsCard(
            icon: FontAwesomeIcons.houseUser,
            title: 'Conviviu nas últimas 2 semanas?',
            readOnly: readOnly,
            children: [
              _CheckboxField(
                  field: 'covidHomemate',
                  icon: FontAwesomeIcons.virus,
                  text: 'Cunha persoa COVID-19+ confirmado',
                  readOnly: readOnly,
                  value: symptoms != null ? symptoms.covidHomemate : null),
              _CheckboxField(
                  field: 'covidSuspectHomemate',
                  icon: FontAwesomeIcons.headSideMask,
                  text:
                      'Cunha persoa en illamento por sospeita de infección pola COVID-19',
                  readOnly: readOnly,
                  value:
                      symptoms != null ? symptoms.covidSuspectHomemate : null),
            ]),
        readOnly
            ? SizedBox(
                height: 0.0,
              )
            : saveButton()
      ],
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
      @required this.children,
      this.readOnly = false})
      : assert(icon != null && title != null && children != null),
        super(key: key);

  final IconData icon;
  final String title;
  final List<Widget> children;
  final bool readOnly;

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
            tileColor: readOnly
                ? Theme.of(context).disabledColor
                : Color.fromARGB(255, 0, 112, 174),
          ),
          ListBody(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
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
      @required this.text,
      this.value,
      this.readOnly = false})
      : assert(field != null && icon != null && text != null),
        super(key: key);

  final String field;
  final IconData icon;
  final String text;
  final bool value;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      return CheckboxListTile(
        value: value,
        title: Text(text),
        secondary: Icon(icon),
      );
    } else {
      return BlocBuilder<TodayCubit, TodayState>(
          buildWhen: (previous, current) =>
              previous.field(field) != current.field(field),
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
}

class _FreetextField extends StatelessWidget {
  const _FreetextField(
      {Key key,
      @required this.field,
      @required this.text,
      this.value,
      this.readOnly = false})
      : assert(field != null && text != null),
        super(key: key);

  final String field;
  final String text;
  final String value;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      TextEditingController _textEditingController =
          TextEditingController(text: value);
      return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
          child: Text(value.isNotEmpty ? value : 'N/A',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Theme.of(context).disabledColor)));
    } else {
      return BlocBuilder<TodayCubit, TodayState>(
          buildWhen: (previous, current) =>
              previous.field(field) != current.field(field),
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
              child: TextField(
                onChanged: (value) =>
                    context.bloc<TodayCubit>().actualSymptomsChanged(value),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: text,
                  helperText: '',
                  errorText: state.actualSymptoms.invalid
                      ? 'Erro nos datos introducidos'
                      : null,
                ),
              ),
            );
          });
    }
  }
}
