import 'package:flutter/material.dart';
import 'package:game_tv/app/ui/home_page/home_page.dart';
import 'package:game_tv/services/navigation/route_enum.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    /// Navigation with arguments
     case EnumRoute.homePage:
       return MaterialPageRoute(
           settings: settings,
           builder: (context) =>
               HomePage());
    default:
      return MaterialPageRoute(
           settings: settings,
           builder: (context) =>
               Container(child: Text('No path for ${settings.name}')));
  }
}

