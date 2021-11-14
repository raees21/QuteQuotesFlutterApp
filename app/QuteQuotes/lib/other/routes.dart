import 'package:flutter/material.dart';
import 'package:qutequotes/Views/HomeView.dart';
import 'package:qutequotes/Views/QuoteView.dart';

final Map<String, WidgetBuilder> appRoutes = {
  HomeView.routeName: (ctx) => HomeView(),
  QuoteScreen.routeName: (ctx) => QuoteScreen(),
};