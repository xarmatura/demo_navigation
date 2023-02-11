import 'package:flutter/material.dart';

import '../navigation/manager.dart';

@immutable
class PairingAppBar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final bool? back;

  const PairingAppBar({
    Key? key,
    required this.text,
    this.back,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: back != null ? IconButton(
        padding: const EdgeInsets.only(left: 20),
        color: Colors.black,
        splashRadius: 24,
        onPressed: () => Manager().pairingRouterDelegate.pop(),
        icon: const Icon(Icons.arrow_back),
      ) : null,
      title: Text("Value = $text", style: const TextStyle(color: Colors.black)),
    );
  }
}
