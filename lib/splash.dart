import 'package:demo_navigation/navigation/configuration.dart';
import 'package:flutter/material.dart';

import 'navigation/manager.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Manager()
          .mainRouterDelegate
          .setNewRoutePath(MyPage.pairing);
    });
    return const Scaffold(body: Center(child: Text("Splash")));
  }
}
