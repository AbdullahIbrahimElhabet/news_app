import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_refresh/home_screens/home_screen.dart';
import 'package:news_refresh/news_screens/news_details.dart';
import 'package:news_refresh/provider/provider_app.dart';
import 'package:news_refresh/setting_screen/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return AppProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    sharedPre();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Arabic, no country code
      ],
      locale: Locale(provider.currentLanguage),
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        SettingScreen.screenName: (context) => SettingScreen(),
        NewsDetails.screenName: (context) => NewsDetails()
      },
      initialRoute: HomeScreen.screenName,
      theme: ThemeData(primaryColor: Color.fromRGBO(57, 165, 82, 1.0)),
    );
  }

  void sharedPre() async {
    final prefs = await SharedPreferences.getInstance();
    provider.changeLanguage(prefs.getString("lang") ?? "en");
  }
}
