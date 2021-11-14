import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qutequotes/models/quotes.dart';
import 'package:qutequotes/Controllers/quotesproviders.dart';
import 'package:qutequotes/Controllers/tagsproviders.dart';
import 'package:qutequotes/Views/QuoteView.dart';
import 'package:qutequotes/Theme/app_colors.dart';

class TagsPage extends StatefulWidget {
  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {


  @override
  Widget build(BuildContext context) {
    List<Quotes> tags = Provider.of<TagsProviders>(context).getTags;
    return tags.length == 0
        ? Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(kLightColor),
            strokeWidth: 3,
            backgroundColor: kLightColor.withOpacity(0.25),
      ),
    )
        : Container(
      child: Column(
        children: [
          SizedBox(height: 6),
          Expanded(
            child: ListView.builder(
              itemCount: tags.length,
              itemBuilder: (BuildContext context, int index) {
                return buildTagCard(
                  context,
                  tags[index].quote,
                  tags[index].author,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTagCard(BuildContext context, String title, String author) {
    return GestureDetector(
      onTap: () {
        Provider.of<QuotesProviders>(context, listen: false).emptyQuotes();
        Navigator.of(context).pushNamed(
          QuoteScreen.routeName,
          arguments: {
            'isTag': true,
            'title': '$title',
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFF31333F),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "$author".toUpperCase(),
                  style: TextStyle(
                    color: Color(0xff99a2ad),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: kLightColor,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}