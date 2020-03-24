import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:covid_19/src/ui/pages/foundation/foundation_page.dart';
import 'package:covid_19/src/ui/pages/main/main_page.dart';

const String initialRoute = '/';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  return CupertinoPageRoute<Widget>(
    settings: settings,
    builder: (BuildContext context) {
      switch (settings.name) {
        case '/':
          return MainPage();
        case '/foundation':
          return FoundationPage(settings.arguments);
        default:
          return MainPage();
      }
    },
  );
}
