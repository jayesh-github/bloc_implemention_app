import 'package:bloc_learn/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_learn/blocs/internet_bloc/internet_state.dart';
import 'package:bloc_learn/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Disconnected!"),
              backgroundColor: Colors.red,
            ));
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          }
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Connected!"),
              backgroundColor: Colors.green,
            ));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CounterPage()),
            );
          }
        },
        builder: (context, state) {
          if (state is InternetLostState) {
            return const Center(
              child: Icon(
                Icons.signal_wifi_connected_no_internet_4,
                size: 40,
              ),
            );
          } else if (state is InternetGainedState) {
            return const Center(
              child: Icon(
                Icons.signal_wifi_4_bar_rounded,
                size: 40,
              ),
            );
          } else /*if (state is InternetInitialState)*/ {
            debugPrint("state is $state");
            //BlocProvider.of<InternetBloc>(context).add(event);
            return Text("Loading..");
            //}
          }
        },
      ),
    ));
  }
}
