import 'package:flutter/material.dart';

import '../configuration.dart';
import '../router.dart';

class InternalBackButtonDispatcher extends ChildBackButtonDispatcher {
  InternalBackButtonDispatcher(super.parent);
}

class InternalRouterDelegate extends BaseRouter {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  InternalRouterDelegate() : super([MyPage.programs]);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      pages: pages.map((e) => e.page()).toList(),
      onPopPage: _onPopPage,
      reportsRouteUpdateToEngine: true,
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (pages.length > 1) {
      final configuration = pages.removeLast();
      if (result != null) {
        configuration.sendResult(result);
      }
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(MyPage<Object?, Object?> configuration) async {
    setPage(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
}

class InternalRouteParser extends RouteInformationParser<MyPage> {
  @override
  Future<MyPage<Object?, Object?>> parseRouteInformation(
      RouteInformation routeInformation) async {
    final lookup = MyPage.parseRoute(
      routeInformation.location ?? MyPage.programs.path,
    );
    return lookup;
  }

  @override
  RouteInformation? restoreRouteInformation(
      MyPage<Object?, Object?> configuration) {
    return RouteInformation(location: configuration.path);
  }
}
