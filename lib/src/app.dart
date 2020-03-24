import 'package:covid_19/src/providers/foundations_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:covid_19/src/utils/theme.dart';
import 'package:covid_19/src/utils/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoundationsProvider>(
          create: (_) => FoundationsProvider(),
          dispose: (_, foundationsProvider) => foundationsProvider.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
