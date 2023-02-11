import 'package:demo_navigation/navigation/manager.dart';
import 'package:flutter/material.dart';

class Internal extends StatelessWidget {
  const Internal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MyPage()));
    // });
    // final parent = Router.of(context).backButtonDispatcher;
    // final child = ChildBackButtonDispatcher(parent!);
    // child.takePriority();

    return Router(
      routerDelegate: Manager().internalRouterDelegate,
      routeInformationParser: Manager().internalRouteParser,
      backButtonDispatcher: Manager().internalBackDispatcher,
    );
  }
}
