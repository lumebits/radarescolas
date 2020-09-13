import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/symptoms/cubit/symptoms_cubit.dart';
import 'package:radarescolas/symptoms/view/symptoms_form.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

class SymptomsPage extends StatelessWidget {
  const SymptomsPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SymptomsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radar Escolas')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<SymptomsCubit>(
          create: (_) => SymptomsCubit(
            context.repository<SymptomsRepository>(),
          ),
          child: SymptomsForm(),
        ),
      ),
    );
  }
}
