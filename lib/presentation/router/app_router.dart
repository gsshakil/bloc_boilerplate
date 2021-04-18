import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_boilerplate/presentation/screens/MyHomePage.dart';
import 'package:flutter_bloc_boilerplate/presentation/screens/SecondPage.dart';
import 'package:flutter_bloc_boilerplate/presentation/screens/ThirdPage.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (context) => SecondPage(),
        );
        break;

      case '/third':
        return MaterialPageRoute(
          builder: (context) => ThirdPage(),
        );
        break;
      default:
        return null;
    }
  }
}
