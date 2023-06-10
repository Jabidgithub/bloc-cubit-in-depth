import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_02/constants/enum.dart';
import 'package:flutter_bloc_cubit_02/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_cubit_02/logic/cubit/internet_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.colors});

  final String title;
  final Color colors;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.wifi) {
                    return Text("Wifi");
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.mobile) {
                    return Text("mobile");
                  } else if (state is InternetDisconnected) {
                    return Text('Disconnected');
                  }
                  return CircularProgressIndicator();
                },
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Incremented")));
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Decremented")));
                  }
                },
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Builder(builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.mobile) {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        'Internet: Mobile',
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.wifi) {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        'Internet: Wifi',
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                } else {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        'Internet: Disconnected',
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                }
              }),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: Text("Go to Second Screen"),
              ),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: Text("Go to Third Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
