import 'package:flutter/material.dart';

import 'package:covid_19/src/utils/theme.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: child,
    );
  }
}
