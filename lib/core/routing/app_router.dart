import 'package:dark_and_light_theming/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return null;
    }
  }
}
