import 'package:flutter/material.dart';

class DynamicPage1 extends StatelessWidget {
  const DynamicPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _listRowColumn(context),
      ),
    );
  }

  _listRowColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageTitle(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_TextTitle(context, '标题栏'), _leftRight('11')],
          ))
        ],
      ),
    );
  }

  _ImageTitle() {
    return SizedBox(
      height: ITEM_HEIGHT,
      width: 150,
      child: Image.network(
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3331308357,177638268&fm=26&gp=0.jpg"),
    );
  }

  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;

  _TextTitle(BuildContext context, String text) {
    return Container(
      height: TITLE_HEIGHT,
      margin: EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  _leftRight(String text) {
    return Container(
      margin: EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
      height: ITEM_HEIGHT - TITLE_HEIGHT,
      child: Row(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: 14.0,
            color: Colors.green,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.green, fontSize: 14.0),
          )
        ],
      ),
    );
  }
}
