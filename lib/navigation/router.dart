import 'package:flutter/material.dart';

import 'configuration.dart';

abstract class BaseRouter extends RouterDelegate<MyPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyPage> {
  final List<MyPage> pages;

  BaseRouter(this.pages);

  static BaseRouter of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    if (delegate is! BaseRouter) {
      throw Exception('Router not found');
    }
    return delegate;
  }

  void setPage(MyPage configuration) {
    pages.removeWhere((element) => true);
    pages.add(configuration);
    notifyListeners();
  }

  void addPage(MyPage configuration) {
    pages.add(configuration);
    notifyListeners();
  }

  void clear(MyPage configuration) {
    pages.removeWhere((element) => element != configuration);
    notifyListeners();
  }

  void setPages(List<MyPage> newPages) {
    pages.removeWhere((element) => true);
    pages.addAll(newPages);
    notifyListeners();
  }

  Future<bool> pop({Object? result}) async {
    final canPop = navigatorKey?.currentState?.canPop() ?? false;
    if (!canPop) {
      return false;
    }
    navigatorKey?.currentState?.pop(result);
    return true;
  }

  @override
  MyPage<Object?, Object?>? get currentConfiguration {
    if (pages.isNotEmpty) {
      return pages.last;
    }
    return null;
  }
}

class MainBackButtonDispatcher extends BackButtonDispatcher {}

