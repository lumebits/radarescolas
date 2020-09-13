import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radarescolas/authentication/authentication.dart';
import 'package:radarescolas/symptoms/cubit/symptoms_cubit.dart';

import '../../theme.dart';

class SymptomsForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar Escolas'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .bloc<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 8.0),
            _Question1(),
            const SizedBox(height: 8.0)
          ],
        ),
      ),
    );
  }
}

class _Question1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.calendar_today_rounded, color: Colors.white),
              title:
              Text('Presentou nas últimas dúas semanas?',
                  style: TextStyle(
                    color: Colors.white,
                  )
              ),
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
                              fontWeight: FontWeight.bold
                          )),
                      FeverStatefulWidget(),
                      CoughStatefulWidget(),
                      BreathStatefulWidget()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}

class FeverStatefulWidget extends StatefulWidget {
  FeverStatefulWidget({Key key}) : super(key: key);

  @override
  _FeverStatefulWidgetState createState() => _FeverStatefulWidgetState();
}

class _FeverStatefulWidgetState extends State<FeverStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Febre maior de 37,5'),
      value: false,
      onChanged: (bool value) {
        setState(() {
          var febre = value;
        });
      },
      secondary: const Icon(FontAwesomeIcons.thermometerFull),
    );
  }
}

class CoughStatefulWidget extends StatefulWidget {
  CoughStatefulWidget({Key key}) : super(key: key);

  @override
  _CoughStatefulWidgetState createState() => _CoughStatefulWidgetState();
}

class _CoughStatefulWidgetState extends State<CoughStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Tose seca'),
      value: false,
      onChanged: (bool value) {
        setState(() {
          var cough = value;
        });
      },
      secondary: const Icon(FontAwesomeIcons.headSideCough),
    );
  }
}

class BreathStatefulWidget extends StatefulWidget {
  BreathStatefulWidget({Key key}) : super(key: key);

  @override
  _BreathStatefulWidgetState createState() => _BreathStatefulWidgetState();
}

class _BreathStatefulWidgetState extends State<BreathStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Dificultade respiratoria'),
      value: false,
      onChanged: (bool value) {
        setState(() {
          var cough = value;
        });
      },
      secondary: const Icon(FontAwesomeIcons.lungsVirus),
    );
  }
}


class _SaveSymptomsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymptomsCubit, SymptomsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
          key: const Key('symptomsForm_continue_raisedButton'),
          child: const Text('GARDAR'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: theme.primaryColor,
          onPressed: state.status.isValidated
              ? () => context.bloc<SymptomsCubit>().symptomsFormSubmitted()
              : null,
        );
      },
    );
  }
}