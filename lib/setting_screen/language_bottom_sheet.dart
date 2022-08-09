import 'package:flutter/material.dart';
import 'package:news_refresh/provider/provider_app.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage("en");
                Navigator.pop(context);
              },
              child:
                  languageSelcted("English", provider.currentLanguage == "en")),
          InkWell(
              onTap: () {
                provider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child:
                  languageSelcted("Arabic", provider.currentLanguage == "ar")),
        ],
      ),
    );
  }

  Widget languageSelcted(String language, bool isSelcted) {
    if (isSelcted) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.check,
              size: 35,
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
