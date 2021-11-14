class Quotes {
  String id;
  String quote;
  String author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}
