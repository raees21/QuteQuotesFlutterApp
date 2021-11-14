import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qutequotes/Controllers/tagsproviders.dart';
import 'package:qutequotes/Views/TagsView.dart';

import 'package:qutequotes/Theme/app_colors.dart';

import 'InsertView.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<TagsProviders>(context).fetchTags();
      //Provider.of<InsertProviders>(context).fetchAuthors();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Qute Quotes'.toUpperCase(),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: kLightColor.withOpacity(0.5),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xFF31333F),
            ),
            labelStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                child: buildTabBar('Quotes'),
              ),
              Tab(
                child: buildTabBar('Insert Quote'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TagsPage(),
            InsertView(),
          ],
        ),
      ),
    );
  }

  Container buildTabBar(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Color(0xFF31333F),
          width: 1,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text('$title'.toUpperCase()),
      ),
    );
  }
}
