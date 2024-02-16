import "package:flutter/material.dart";
import "package:flutter_application_1/block/counter_bloc.dart";
import "package:flutter_application_1/block/counter_page.dart";
import "package:flutter_bloc/flutter_bloc.dart";


void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}
