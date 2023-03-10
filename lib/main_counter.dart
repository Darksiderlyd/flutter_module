import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'helper/channel_helper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _msg = "";
  VoidCallback? remover;

  @override
  void initState() {
    super.initState();
    remover = MixChannel.addEventListener('appSend',  (key, arguments) {
      _receiveNewMsg(arguments["appSendMsg"]);
      return Future<dynamic>.value();
    });

  }

  void _receiveNewMsg(String msg){
    setState(() {
      _msg = msg;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      Map<String, Object> map = {"flutterSendMsg": _counter};

      MixChannel.sendEventToNative("flutterSend", map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times $_msg:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
    MixChannel.removeListener(remover);
  }
}
