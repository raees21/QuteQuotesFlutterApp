import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:qutequotes/models/quotes.dart';

class TagsProviders with ChangeNotifier {
  List<Quotes> _tags = [];

  var baseUrl = 'http://10.0.2.2:5000';

  get getTags {
    return [..._tags];
  }

  fetchTags() async {
    log('Fetching Tags Quotes.....');
    try {
      http.Response response = await get('$baseUrl/quotes');

      String json = response.body;
      _tags = (jsonDecode(json) as List).map((i) =>
          Quotes.fromJson(i)).toList();

      for (int i = 0; i < _tags.length; i++) {
        if (_tags[i].author.length > 30) {
          _tags[i].author = _tags[i].author.substring(0, 22) + "...";
        }
        if (_tags[i].author.length > 30) {
          _tags[i].author = _tags[i].author.substring(0, 22) + "...";
        }
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<Quotes> createQuote(String quote, String author) async {
    final response = await http.post('$baseUrl/quotes',
      body: jsonEncode(<String, String>{
        'quote': quote,
        'author': author,
      }),
    );
    fetchTags();
  }

}