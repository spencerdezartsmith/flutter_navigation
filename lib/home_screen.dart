import 'package:flutter/material.dart';
import 'custom/app_flow.dart';
import 'custom/adaptive_bottom_navigation_scaffold.dart';
import 'custom/bottom_navigation_tab.dart';
import 'indexed_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // AppFlow is just a class I created for holding information
  // about our app's flows.
  final List<AppFlow> appFlows = [
    AppFlow(
      title: 'Video',
      iconData: Icons.ondemand_video,
      mainColor: Colors.red,
      navigatorKey: GlobalKey<NavigatorState>(),
    ),
    AppFlow(
      title: 'Music',
      iconData: Icons.music_note,
      mainColor: Colors.green,
      navigatorKey: GlobalKey<NavigatorState>(),
    )
  ];

  @override
  Widget build(BuildContext context) => AdaptiveBottomNavigationScaffold(
        navigationBarItems: appFlows
            .map(
              (flow) => BottomNavigationTab(
                bottomNavigationBarItem: BottomNavigationBarItem(
                  title: Text(flow.title),
                  icon: Icon(flow.iconData),
                ),
                navigatorKey: flow.navigatorKey,
                initialPageBuilder: (context) => IndexedPage(
                  index: 1,
                  backgroundColor: flow.mainColor,
                  containingFlowTitle: flow.title,
                ),
              ),
            )
            .toList(),
      );
}
