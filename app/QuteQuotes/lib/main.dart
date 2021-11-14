import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controllers/quotesproviders.dart';
import 'Controllers/tagsproviders.dart';
import 'Theme/app_theme.dart';
import 'Views/HomeView.dart';
import 'other/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => QuotesProviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TagsProviders(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => InsertProviders(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Quotes App",
        initialRoute: HomeView.routeName,
        routes: appRoutes,
        theme: themeData(),
      ),
    );
  }
}
