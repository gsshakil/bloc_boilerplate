import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/presentation/router/app_router.dart';
import 'package:flutter_bloc_boilerplate/presentation/screens/ThirdPage.dart';
import 'presentation/screens/MyHomePage.dart';
import 'presentation/screens/SecondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        home: MyHomePage(),
      ),
    );
  }
}
