import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radarescolas/history/history.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
      if (state is HistoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is HistoryLoaded) {
        final symptomsList = state.symptoms;
        return SafeArea(
          child: ListView.builder(
            itemCount: symptomsList.length,
            itemBuilder: (context, index) {
              final symptoms = symptomsList[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: HistoryItem(symptoms: symptoms),
              );
            },
          ),
        );
      } else {
        return Center(child: Text("Erro na conexión co servidor"));
      }
    });
  }
}
