import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/authentication/authentication.dart';
import 'package:radarescolas/home/home.dart';
import 'package:radarescolas/navigation/navigation.dart';
import 'package:radarescolas/today/today.dart';

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

            title: const Text('Radar Escolas'),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: (action) {
                  switch (action) {
                    case 'Logout':
                      context
                          .bloc<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested());
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: 'Logout',
                    child: Text('Pechar sesión'),
                  )
                ]
              ),
            ],
          ),
          body: activeTab == AppTab.today ? TodayPage() : (activeTab == AppTab.history ? History() : Info()),
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