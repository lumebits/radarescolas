import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radarescolas/sign_up/sign_up.dart';
import 'package:formz/formz.dart';
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
              const SnackBar(content: Text('Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ToggleSwitch(
                minWidth: 120.0,
                initialLabelIndex: 0,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                labels: ['Mestre/a', 'Alumno/a'],
                icons: [FontAwesomeIcons.graduationCap, FontAwesomeIcons.child],
                activeBgColors: [theme.colorScheme.secondary, theme.colorScheme.secondary],
                onToggle: (index) {
                  String roleLabel = 'Mestre/a';
                  if (index == 1) {
                    roleLabel = 'Alumno/a';
                  }
                  context.bloc<SignUpCubit>().roleChanged(roleLabel);
                }
            ),
            const SizedBox(height: 36.0),
            _EmailInput(),
            const SizedBox(height: 8.0),
            _PasswordInput(),
            const SizedBox(height: 8.0),
            _SignUpButton(),
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
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            helperText: '',
            errorText: state.email.invalid ? 'Correo electrónico non válido' : null,
          ),
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
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contrasinal',
            helperText: '',
            errorText: state.password.invalid ? 'Contrasinal non válido' : null,
          ),
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
            ? const CircularProgressIndicator()
            : RaisedButton(
          key: const Key('signUpForm_continue_raisedButton'),
          child: const Text('REXISTRARSE'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: theme.primaryColor,
          onPressed: state.status.isValidated
              ? () => context.bloc<SignUpCubit>().signUpFormSubmitted()
              : null,
        );
      },
    );
  }
}