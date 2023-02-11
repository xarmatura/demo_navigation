import 'package:flutter/material.dart';

import '../../../navigation/configuration.dart';
import '../../../navigation/manager.dart';

class Programs extends StatelessWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Programs = ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                Manager().internalRouterDelegate.addPage(MyPage.settings);
              },
              child: const Text(
                "Move forward",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                Manager().mainRouterDelegate.addPage(MyPage.pairing);
              },
              child: const Text(
                "Go pairing",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
