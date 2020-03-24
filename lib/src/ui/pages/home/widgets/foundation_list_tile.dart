import 'package:flutter/material.dart';

import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:covid_19/src/models/foundation.dart';
import 'package:covid_19/src/ui/widgets/app_container.dart';
import 'package:shimmer/shimmer.dart';

class FoundationListTile extends StatelessWidget {
  const FoundationListTile([this.foundation]);

  final Foundation foundation;

  @override
  Widget build(BuildContext context) {
    if (foundation != null) {
      return AppContainer(
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, '/foundation',
              arguments: foundation),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage:
                AssetImage('assets/images/foundation_placeholder.png'),
          ),
          title: Text('${foundation.name}'),
          subtitle: Text('\$${foundation.balance} / \$${foundation.goal}'),
          trailing: Icon(OMIcons.chevronRight),
        ),
      );
    }
    return _loadingFoundationListTile(context);
  }

  Widget _loadingFoundationListTile(BuildContext context) {
    return AppContainer(
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).dividerColor,
        highlightColor: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              const CircleAvatar(),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 16,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 16,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
