import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/nested_bloc.dart';

class Format extends StatelessWidget {
  const Format({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NestedBloc, NestedState>(
      builder: (context, state) {
        return Text(state.value.toString());
      },
    );
  }
}
