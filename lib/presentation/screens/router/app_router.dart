import 'package:flutter/material.dart';
import 'package:flutter_bloc_cubit_02/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_cubit_02/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_cubit_02/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              MyHomePage(title: "Home Screen", colors: Colors.blueAccent),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) =>
              SecondScreen(title: "Second Screen", colors: Colors.redAccent),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(title: "Third Screen", colors: Colors.greenAccent),
        );
        break;
      default:
        return null;
    }
  }
}
