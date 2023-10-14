import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunflower/feature/presentation/pages/garden_page.dart';

Route router(RouteSettings settings) {
  switch (settings.name) {
    /*case TestPage.routeName:
      return CupertinoPageRoute(builder: (_) => const TestPage());*/
    default:
      return CupertinoPageRoute(builder: (_) => const GardenPage());
  }
}
