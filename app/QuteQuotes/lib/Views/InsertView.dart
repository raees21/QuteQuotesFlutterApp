import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qutequotes/Controllers/quotesproviders.dart';
import 'package:qutequotes/Controllers/tagsproviders.dart';
import 'package:qutequotes/models/quotes.dart';

class InsertView extends StatefulWidget {
  const InsertView({Key key}) : super(key: key);

  @override
  _InsertViewState createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {

  TextEditingController myController = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  String author = '';
  String quote = '';

  void submit(){
    setState(() {
      author = myController.text;
      quote = myController2.text;
    });
    Provider.of<TagsProviders>(context, listen: false).createQuote(quote, author);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          cursorColor: Theme.of(context).cursorColor,
          maxLength: 50,
          controller: myController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            icon: Icon(Icons.chevron_right_rounded, color: Colors.white),
            labelText: 'Quote',
            helperText: 'Please input a Quote',
            labelStyle: TextStyle(
                color:Colors.white),
            helperStyle: TextStyle(
              color:Colors.white
            ),
            suffixIcon: Icon(
              Icons.error, color: Colors.red
            ),
          ),
        ),
        TextFormField(
          cursorColor: Theme.of(context).cursorColor,
          maxLength: 50,
          controller: myController2,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            icon: Icon(Icons.chevron_right_rounded, color: Colors.white,),
            labelText: 'Author',
            helperText: 'Please input a Author',
            labelStyle: TextStyle(
                color:Colors.white),
            helperStyle: TextStyle(
                color:Colors.white
            ),
            suffixIcon: Icon(
              Icons.error, color: Colors.red
            ),
          ),
        ),
        ElevatedButton(onPressed: submit, child: Text("Submit")),
      ]),
    );
  }
}

