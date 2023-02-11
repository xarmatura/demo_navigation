import 'package:demo_navigation/navigation/manager.dart';
import 'package:flutter/material.dart';

class Pairing extends StatelessWidget {
  const Pairing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final parent = Router.of(context).backButtonDispatcher;
    // final child = ChildBackButtonDispatcher(parent!);
    // child.takePriority();
    final backButtonDispatcher = Manager().pairingBackDispatcher;
    // backButtonDispatcher.;

    return Router(
      routerDelegate: Manager().pairingRouterDelegate,
      routeInformationParser: Manager().pairingRouteParser,
      backButtonDispatcher: backButtonDispatcher,
    );
  }
}
