import 'package:demo_navigation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pairing_bloc.dart';
import '../navigation/configuration.dart';
import '../navigation/manager.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final del = Manager().pairingRouterDelegate;

    return BlocBuilder<PairingBloc, PairingState>(
      // buildWhen: (prev, curr) {
      //   if (del.currentConfiguration == MyPage.start &&
      //       prev.value != curr.value) {
      //     debugPrint("true");
      //     return true;
      //   }
      //   return false;
      // },
      builder: (context, state) {
        debugPrint("Start ${state.value}");
        debugPrint(del.currentConfiguration?.path);

        return Scaffold(
          appBar: PairingAppBar(text: "${MyPage.start.key} ${state.value}"),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    onPressed: () {
                      Manager().pairingRouterDelegate.addPage(MyPage.search);
                    },
                    child: const Text(
                      "Move forward",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    onPressed: () {
                      context.read<PairingBloc>().increase();
                    },
                    child: const Text(
                      "Bloc increase",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
