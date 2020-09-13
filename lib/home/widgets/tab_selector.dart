import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radarescolas/navigation/navigation.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: const Key('tabs'),
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == AppTab.today
                ? Icons.wb_sunny
                : (tab == AppTab.history ? Icons.history : Icons.info),
            key: tab == AppTab.today
                ? const Key('today_tab')
                : (tab == AppTab.history
                    ? const Key('history_tab')
                    : const Key('info_tab')),
          ),
          title: Text(tab == AppTab.today
              ? 'Hoxe'
              : (tab == AppTab.history ? 'Historial' : 'Info')),
        );
      }).toList(),
    );
  }
}
