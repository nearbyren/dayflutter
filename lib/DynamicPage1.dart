import 'package:flutter/material.dart';

class DynamicPage1 extends StatelessWidget {
  const DynamicPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DynamicPage1',
          style: Theme.of(context).textTheme.bodyText1, //引用主题字体
        ),
      ),
    );
  }
}
