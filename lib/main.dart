import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由範例',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: <String, WidgetBuilder>{
      // 註冊路由
        'home': (context) => MyHomePage(),
        'parameters_page': (context) => ParametersRoute(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('路由範例'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _controller,
              decoration: new InputDecoration(
                hintText: '此處輸入之文字，會被傳遞至第二頁',
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('parameters_page', arguments: _controller.text);
              },
              child: Text(
                '請點我',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

class ParametersRoute extends StatelessWidget {
  final Topic = Text('路由範例');

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('路由範例'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('傳遞參數為: ' + args.toString()),
          )
        ],
      ),
    );
  }
}
