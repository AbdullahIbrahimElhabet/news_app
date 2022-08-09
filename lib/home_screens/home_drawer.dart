import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int CATEGORIES = 1;
  static const int SETTINGS = 2;
  Function onDrawerClicked;

  HomeDrawer(this.onDrawerClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(60),
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.newsapp,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ))),
          InkWell(
            onTap: () {
              onDrawerClicked(CATEGORIES);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  Text(
                    AppLocalizations.of(context)!.category,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerClicked(SETTINGS);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
