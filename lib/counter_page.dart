import 'package:bloc_learn/blocs/cubit/counter_cubit.dart';
import 'package:bloc_learn/blocs/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter Value:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${state.count}',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "increment",
                    onPressed: () => context.read<CounterCubit>().increment(),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 25),
                  FloatingActionButton(
                    heroTag: "decrement",
                    onPressed: () => context.read<CounterCubit>().decrement(),
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
