import 'package:demo_navigation/interal/internal.dart';
import 'package:demo_navigation/interal/settings/settings.dart';
import 'package:demo_navigation/pairing/devices.dart';
import 'package:demo_navigation/pairing/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internal_bloc.dart';
import '../bloc/nested_bloc.dart';
import '../bloc/pairing_bloc.dart';
import '../interal/programs/cycles/programs.dart';
import '../interal/settings/format.dart';
import '../pairing/pairing.dart';
import '../pairing/search.dart';
import '../splash.dart';

///Class which describes application navigation pages
///How to push see [PushPageConfig]
class MyPage<T extends Object?, R extends Object?> {
  ///Configuration key
  final String key;

  ///Configuration path
  final String path;

  ///Configuration UI Page
  // final Pages page;

  ///Configuration parameters
  ///Can be modified with [updateParams] function
  final T? params;

  final Widget Function(T?) pageProvider;

  final void Function(R?)? result;

  Widget build() {
    return pageProvider(params);
  }

  Page page() {
    return MaterialPage(
      key: ValueKey(key),
      child: build(),
    );
  }

  sendResult(Object? result) {
    if (this.result != null && result != null && result is R) {
      this.result!(result as R);
    } else {
      throw Exception("Can't send result");
    }
  }

  const MyPage._(
    this.key,
    this.path,
    this.pageProvider, {
    this.params,
    this.result,
  });

  static List<MyPage> pages = [splash];

  static MyPage<Object?, Object?> parseRoute(String path) {
    return pages.firstWhere((page) => page.path == path);
  }

  /// Splash screen configuration
  static MyPage splash = MyPage._(
    'splash',
    '/',
    (p0) => const Splashscreen(),
  );

  /// Home screen configuration
  static MyPage pairing = MyPage._(
    'pairing',
    '/pairing',
    (_) {
      return BlocProvider<PairingBloc>(
        create: (_) => PairingBloc(),
        child: const Pairing(),
      );
    },
  );

  static MyPage start = MyPage._(
    'start',
    '${pairing.path}/start',
    (_) => const Start(),
  );

  static MyPage search = MyPage._(
    'search',
    '${pairing.path}/search',
    (_) => const Search(),
  );

  static MyPage available = MyPage._(
    'available',
    '${pairing.path}/available',
    (_) => const Available(),
  );

  static MyPage internal = MyPage._(
    'internal',
    '/internal',
    (_) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<InternalBloc>(
            create: (_) => InternalBloc(),
          ),
          // BlocProvider<NestedBloc>(
          //   create: (BuildContext context) => NestedBloc(),
          // ),
          // BlocProvider<BlocC>(
          //   create: (BuildContext context) => BlocC(),
          // ),
        ],
        child: const Internal(),
      );
      // return BlocProvider<InternalBloc>(
      //   create: (_) => InternalBloc(),
      //   child: const Internal(),
      // );
    },
  );

  static MyPage programs = MyPage._(
    'programs',
    '${internal.path}/programs',
    (_) => const Programs(),
  );

  static NestedBloc? nestedBloc;

  static MyPage settings = MyPage._(
    'settings',
    '${internal.path}/${programs.path}/settings',
    (_) => BlocProvider<NestedBloc>(
      create: (_) {
        return nestedBloc ??= NestedBloc();
      },
      child: const Settings(),
    ),
  );

  // static MyPage settings2 = MyPage._(
  //   'settings',
  //   '${internal.path}/${programs.path}/settings',
  //   (_) => const Settings(),
  // );
  //
  // static MyPage format2 = MyPage._(
  //   'format',
  //   '${internal.path}/${programs.path}/${settings.path}/format',
  //   (_) {
  //     return const Format();
  //   },
  // );

  static MyPage format = MyPage._(
    'format',
    '${internal.path}/${programs.path}/${settings.path}/format',
    (_) {
      final bloc = nestedBloc;

      if (bloc == null) {
        throw TypeError();
      }
      return BlocProvider.value(value: bloc, child: const Format());
    },
  );

  MyPage<T, R> updateParams(T params) {
    return MyPage._(
      key,
      path,
      pageProvider,
      params: params,
      result: result,
    );
  }

  MyPage<T, R> updateResult(void Function(R?) result) {
    return MyPage._(
      key,
      path,
      pageProvider,
      params: params,
      result: result,
    );
  }

  MyPage<T, R> updateParamsResult(T params, void Function(R?) result) {
    return MyPage._(
      key,
      path,
      pageProvider,
      params: params,
      result: result,
    );
  }
}
