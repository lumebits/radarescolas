import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/sign_up/sign_up.dart';

import '../../theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: BlocProvider<SignUpCubit>(
            create: (_) => SignUpCubit(
              context.repository<AuthenticationRepository>(),
            ),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
