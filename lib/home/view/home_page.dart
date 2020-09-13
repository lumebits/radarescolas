import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/authentication/authentication.dart';
import 'package:radarescolas/home/home.dart';
import 'package:radarescolas/navigation/navigation.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Radar Mestres'),
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
          body: activeTab == AppTab.today ? Today() : (activeTab == AppTab.history ? History() : Info()),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<NavigationBloc>(context).add(TabTapped(tab: tab)),
          ),
        );
      },
    );
  }
}
