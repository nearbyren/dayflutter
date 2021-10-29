import 'package:flutter/material.dart';

/**
 * 自定义widget控件
 */
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key key}) : super(key: key);
  TabController _controller;

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1092, 1092);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return _RowWidget();
  }

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: ScrollableState(),
    );
  }

  _RowWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          _tabBarWidget(),
          Container(
            width: 40,
            child: Icon(Icons.add),
          ),
          Container(
            width: 40,
            child: Icon(Icons.save_alt),
          )
        ],
      ),
    );
  }

  _tabBarWidget() {
    return Expanded(
      child: TabBar(
        controller: _controller,
        tabs: <Widget>[
          Tab(
            text: '电影',
          ),
          Tab(
            text: '电视',
          ),
          Tab(
            text: '综艺',
          ),
          Tab(
            text: '读书',
          ),
        ],
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        indicatorWeight: 5.0,
        labelStyle: TextStyle(height: 2),
      ),
    );
  }
}
