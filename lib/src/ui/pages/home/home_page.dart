import 'package:covid_19/src/models/foundation.dart';
import 'package:covid_19/src/providers/foundations_provider.dart';
import 'package:covid_19/src/ui/pages/home/widgets/foundation_list_tile.dart';
import 'package:covid_19/src/ui/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Foundation>>(
          stream: FoundationsProvider().foundationStream,
          builder: (context, snapshot) {
            print(snapshot.data.toString());
            if (snapshot.data != null)
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(16),
                itemCount: snapshot?.data?.length ?? 10,
                separatorBuilder: (_, int i) {
                  return SizedBox(height: 8);
                },
                itemBuilder: (_, int i) {
                  return FoundationListTile(snapshot.data[i] ?? null);
                },
              );
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              itemCount: snapshot?.data?.length ?? 10,
              separatorBuilder: (_, int i) {
                return SizedBox(height: 8);
              },
              itemBuilder: (_, int i) {
                return FoundationListTile();
              },
            );
          }),
    );
  }
}
