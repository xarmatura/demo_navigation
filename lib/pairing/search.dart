import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pairing_bloc.dart';
import '../navigation/configuration.dart';
import '../navigation/manager.dart';
import '../widgets/app_bar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PairingBloc, PairingState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) {
        if (state.value == 4) {
          Manager().pairingRouterDelegate.addPage(MyPage.available);
        }
      },
      builder: (context, state) {
        debugPrint("Search ${state.value}");
        return Scaffold(
          appBar: PairingAppBar(
            text: "${MyPage.search.key} ${state.value}",
            back: true,
          ),
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
                      Manager().pairingRouterDelegate.clear(MyPage.start);
                      Manager().mainRouterDelegate.setNewRoutePath(MyPage.internal);
                    },
                    child: const Text(
                      "Go internal",
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
