import 'package:flutter/material.dart';

import '../../navigation/configuration.dart';
import '../../navigation/manager.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          color: Colors.black,
          splashRadius: 24,
          onPressed: () => Manager().internalRouterDelegate.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Value = ",
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
                // Manager().mainRouterDelegate.addPage(MyPage.pairing);
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
              },
              child: const Text(
                "Go another",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
