import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunflower/feature/presentation/widgets/plant_list.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    /*case TestPage.routeName:
      return CupertinoPageRoute(builder: (_) => const TestPage());*/
    default:
      return CupertinoPageRoute(
          builder: (_) => const Scaffold(body: PlantList()));
  }
}
