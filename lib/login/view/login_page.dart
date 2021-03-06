import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/login/login.dart';

import '../../theme.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
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
          child: BlocProvider(
            create: (_) => LoginCubit(
              context.repository<AuthenticationRepository>(),
            ),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
