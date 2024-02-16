import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "counter_bloc.dart";

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: _getBody(),
        floatingActionButton: _getFloatingButtons(context));
  }

  Widget _getBody() {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Center(
          child: Text(
            "${state.counter}",
            style: const TextStyle(fontSize: 24.0),
          ),
        );
      },
    );
  }

  Widget _getFloatingButtons(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _getFloatingButton(
              context, const Icon(Icons.add), CounterIncrementPressed()),
          _getFloatingButton(
              context, const Icon(Icons.remove), CounterDecrementPressed())
        ]);
  }

  Padding _getFloatingButton(
      BuildContext context, Icon icon, CounterEvent event) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: FloatingActionButton(
          child: icon, onPressed: () => context.read<CounterBloc>().add(event)),
    );
  }
}
