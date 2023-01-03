import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'code_bloc.dart';

class CodePage extends StatelessWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('XorAuth Code')),
      body: BlocListener<CodeBloc, CodeState>(
        listener: ((context, codeState) {
          var snackBar = ScaffoldMessenger.of(context);
          if (codeState.error != null) {
            snackBar.showSnackBar(
              SnackBar(content: Text("${codeState.error?.message}, code: ${codeState.error?.code}")),
            );
          }
        }),
        child: BlocBuilder<CodeBloc, CodeState>(
          builder: (context, codeState) {
            return Center(
              child: const Text("hello code!"),
            );
          },
        ),
      )
    );
  }
}