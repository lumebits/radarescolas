import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radarescolas/today/today.dart';
import 'package:symptoms_repository/symptoms_repository.dart';

class HistoryItem extends StatelessWidget {
  final Symptoms symptoms;
  final dateFormat = DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY);

  HistoryItem({Key key, @required this.symptoms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: new PageStorageKey<String>(symptoms.id),
      title: Text(dateFormat.format(symptoms.date)),
      leading: symptoms.hasAnySymptom()
          ? Icon(Icons.warning_rounded, color: Colors.red)
          : Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
            ),
      children: [
        Questionnaire(
          symptoms: symptoms,
          readOnly: true,
        )
      ],
    );
  }
}
