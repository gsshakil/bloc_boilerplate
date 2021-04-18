import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/logic/cubit/counter_cubit.dart';

import 'SecondPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Incremented')));
                } else {
                  if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Decremented')));
                  }
                }
              },
              builder: (context, state) {
                if (state.counterValue > 2) {
                  return Text(
                    'Its more than 2',
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else if (state.counterValue < 2) {
                  return Text(
                    'Its less than 2',
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Text('+')),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: Text('-')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                              value: BlocProvider.of<CounterCubit>(context),
                              child: SecondPage())));
                },
                child: Text('Next Screen'))
          ],
        ),
      ),
    );
  }
}
