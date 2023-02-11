import 'package:flutter/material.dart';

import '../configuration.dart';
import '../router.dart';

class MainBackButtonDispatcher extends RootBackButtonDispatcher {}

class MainRouteParser extends RouteInformationParser<MyPage> {
  @override
  Future<MyPage<Object?, Object?>> parseRouteInformation(
      RouteInformation routeInformation) async {
    return MyPage.parseRoute(
      routeInformation.location ?? MyPage.splash.path,
    );
  }

  @override
  RouteInformation? restoreRouteInformation(
      MyPage<Object?, Object?> configuration) {
    return RouteInformation(location: configuration.path);
  }
}

class MainRouterDelegate extends BaseRouter {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  MainRouterDelegate({List<MyPage<Object?, Object?>>? pages})
      : super(pages ?? [MyPage.splash]);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      reportsRouteUpdateToEngine: true,
      key: _navigatorKey,
      pages: pages.map((e) => e.page()).toList(),
      onPopPage: _onPopPage,
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
  Future<void> setNewRoutePath(
      MyPage<Object?, Object?> configuration) async {
    setPage(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
}
