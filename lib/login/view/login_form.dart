import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:radarescolas/login/login.dart';
import 'package:radarescolas/sign_up/sign_up.dart';

import '../../theme.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Erro na autenticación')),
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
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Text(
                    'Radar Escolas',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 24.0),
                  _EmailInput(),
                  const SizedBox(height: 8.0),
                  _PasswordInput(),
                  const SizedBox(height: 24.0),
                  _LoginButton(),
                  //const SizedBox(height: 16.0),
                  //_GoogleLoginButton(),
                  const SizedBox(height: 4.0),
                  _SignUpButton(),
                ],
              )
            ],
          ),
        ));
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.bloc<LoginCubit>().emailChanged(email),
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<LoginCubit>().passwordChanged(password),
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

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : RaisedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(color: theme.primaryColor),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                onPressed: state.status.isValidated
                    ? () => context.bloc<LoginCubit>().logInWithCredentials()
                    : null,
              );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RaisedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'INICIAR SESIÓN CON GOOGLE',
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
      color: theme.colorScheme.secondary,
      onPressed: () => context.bloc<LoginCubit>().logInWithGoogle(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: const Key('loginForm_createAccount_flatButton'),
      child: Text(
        'CREAR UNHA CONTA',
        style: TextStyle(color: Colors.white.withAlpha(220)),
      ),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
    );
  }
}
