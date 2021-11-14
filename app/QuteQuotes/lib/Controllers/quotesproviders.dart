import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qutequotes/models/quotes.dart';

class QuotesProviders with ChangeNotifier {
  List<Quotes> _quotes = [];

  var baseUrl = 'http://10.0.2.2:5000';

  get getQuotes {
    return [..._quotes];
  }

  emptyQuotes() {
    _quotes = [];
  }

  fetchByTag(String tag) async {
    log('Fetching Tags Quotes.....');
    try {
      http.Response response = await get('$baseUrl/quotes');
      String json = response.body;
      _quotes=(jsonDecode(json) as List).map((i) =>
          Quotes.fromJson(i)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }


  }
}
