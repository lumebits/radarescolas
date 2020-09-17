import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/sign_up/sign_up.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../theme.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Erro no rexistro')),
            );
        }
      },
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: [
                Image.asset(
                  'assets/icon.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text(
                  'Radar Escolas',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 24.0),
                ToggleSwitch(
                    minWidth: 120.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: theme.colorScheme.secondary,
                    inactiveBgColor: Colors.black12,
                    inactiveFgColor: Colors.white,
                    labels: ['Docente', 'Estudante'],
                    icons: [
                      FontAwesomeIcons.graduationCap,
                      FontAwesomeIcons.child
                    ],
                    activeBgColor: Colors.white,
                    onToggle: (index) {
                      String roleLabel = 'Docente';
                      if (index == 1) {
                        roleLabel = 'Estudante';
                      }
                      context.bloc<SignUpCubit>().roleChanged(roleLabel);
                    }),
                const SizedBox(height: 36.0),
                _EmailInput(),
                const SizedBox(height: 8.0),
                _PasswordInput(),
                const SizedBox(height: 24.0),
                _SignUpButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => context.bloc<SignUpCubit>().emailChanged(email),
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Enderezo electrónico',
              helperText: '',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
              errorText:
                  state.email.invalid ? 'Correo electrónico non válido' : null,
              errorStyle: TextStyle(color: Colors.yellowAccent),
              border: InputBorder.none),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<SignUpCubit>().passwordChanged(password),
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Contrasinal',
              helperText: '',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
              errorText:
                  state.password.invalid ? 'Contrasinal non válido' : null,
              errorStyle: TextStyle(color: Colors.yellowAccent),
              border: InputBorder.none),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : RaisedButton(
                key: const Key('signUpForm_continue_raisedButton'),
                child: Text('REXISTRARSE',
                    style: TextStyle(color: theme.primaryColor)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                onPressed: state.status.isValidated
                    ? () => context.bloc<SignUpCubit>().signUpFormSubmitted()
                    : null,
              );
      },
    );
  }
}
