import 'package:demo_navigation/navigation/components/internal_router.dart';
import 'package:flutter/foundation.dart';

import 'components/app_router.dart';
import 'components/pairing_router.dart';

class Manager {
  static final Manager _instance = Manager._internal();

  Manager._internal();

  factory Manager() {
    return _instance;
  }

  final MainRouterDelegate mainRouterDelegate = MainRouterDelegate();
  final MainRouteParser mainRouteParser = MainRouteParser();
  final MainBackButtonDispatcher mainBackDispatcher = MainBackButtonDispatcher();

  final PairingRouterDelegate pairingRouterDelegate = PairingRouterDelegate();
  final PairingRouteParser pairingRouteParser = PairingRouteParser();

  PairingBackButtonDispatcher get pairingBackDispatcher {
    final dispatcher = PairingBackButtonDispatcher(mainBackDispatcher);
    dispatcher.takePriority();
    return dispatcher;
  }

  final InternalRouterDelegate internalRouterDelegate = InternalRouterDelegate();
  final InternalRouteParser internalRouteParser = InternalRouteParser();

  InternalBackButtonDispatcher get internalBackDispatcher {
    final dispatcher = InternalBackButtonDispatcher(mainBackDispatcher);
    dispatcher.takePriority();
    return dispatcher;
  }
}
