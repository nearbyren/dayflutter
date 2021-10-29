import 'package:flutter/material.dart';
import 'package:flutter_walle_plugin/flutter_walle_plugin.dart';

import 'myappbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _platformVersion = 'Unknown';

  final List<String> _tabValues = ['a', 'b', 'c', 'd'];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterWallePlugin.getWalleChannel();
    } on Exception {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  _centerWidget() {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:$_platformVersion\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  _stackWidget() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
        Positioned(
            left: 100,
            top: 100,
            width: 150,
            height: 150,
            child: Container(
              color: Colors.blue,
            )),
        _pageView()
        /* Container(
          height: 150,
          width: 150,
          color: Colors.amber,
        ),
        Container(
            width: 100,
            height: 100,
            color: Colors.black12
        )*/
      ],
    );
  }

  _containerWidget() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            width: 100,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  _buildPageView(String txt, {Color color = Colors.red}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  _pageView() {
    return Center(
      child: Container(
        height: 230,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemBuilder: (context, index) {
                return _buildPageView(_tabValues[index % (_tabValues.length)]);
              },
              itemCount: 10,
              onPageChanged: (int index) {
                setState(() {
                  _counter = index % (_tabValues.length);
                });
              },
            ),
            Positioned(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_tabValues.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _counter == index ? Colors.blue : Colors.grey),
                      );
                    }).toList(),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _initContainer(){
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.blue,
        child: Container(
          color: Colors.red,
          margin: EdgeInsets.fromLTRB(10, 0, 20, 30),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white60,
            child: Text('我是文本  长文本啊 '),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: MyAppBar(),
      body: _initContainer(),
      floatingActionButton:
          _FloatWidget(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _FloatWidget() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }

}
