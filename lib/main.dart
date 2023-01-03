import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'code_bloc.dart';
import 'code_page.dart';

Future<void> main() async => runApp(const CodeApp());

class CodeApp extends StatelessWidget {
  const CodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CodeBloc(),
        child: const CodePage(),
      ),
    );
  }
}