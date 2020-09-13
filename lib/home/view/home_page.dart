import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:radarescolas/home/home.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final _firebaseAuth = FirebaseAuth.instance;
    final textTheme = Theme.of(context).textTheme;
    var user = context.bloc<AuthenticationBloc>().state.user;
    final firebaseUser = _firebaseAuth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoxe'),
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
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline5),
            const SizedBox(height: 4.0),
            Text(firebaseUser.displayName ?? '', style: textTheme.headline5),
          ],
        ),
      ),
    );
  }
}
