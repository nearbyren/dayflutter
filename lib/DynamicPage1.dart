import 'package:flutter/material.dart';

class DynamicPage1 extends StatelessWidget {

  static const double ITEM_HEIGHT = 100;
  static const double TITLE_HEIGHT = 80;
  static const double MARGIN_SIZE = 10;

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
          _getRoundImage(),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_TextTitle(context, '标题栏1ss'), _leftRight('11')],
              ))
        ],
      ),
    );
  }

  //圆角头像
  _getRoundImage() {
    return Container(
      width: ITEM_HEIGHT,
      height: ITEM_HEIGHT,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(ITEM_HEIGHT / 2)),
      ),
      child: Image.asset('images/2d.jpeg', fit: BoxFit.fitWidth,),
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

  _TextTitle(BuildContext context, String text) {
    return Container(
      height: TITLE_HEIGHT,
      margin: EdgeInsets.fromLTRB(MARGIN_SIZE, 0, 0, 0),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme
            .of(context)
            .textTheme
            .headline6,
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
