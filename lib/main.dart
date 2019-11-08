import 'package:flutter/material.dart';
import './index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '地暖系统',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'homePage',
      routes:<String, WidgetBuilder> {
        // "new_page": (context) =>
        //     TipRoute(haha: ModalRoute.of(context).settings.arguments),
        // "/": (context) => new MyHomePage(title: 'Flutter Demo Home Page'),
        'login': (context) => new LoginPage(),
        'homePage': (context) => new HomePage()
      },
      // onGenerateRoute 路由守卫
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text(
//               'You have pushed the button this many times:',
//             ),
//             new Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//             FlatButton(
//               child: Text('打开新的路由'),
//               textColor: Colors.green,
//               onPressed: () {
//                 Navigator.pushNamed(context, 'new_page',
//                     arguments: {'firstcanshu': '11asd'});
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 //   return TipRoute(
//                 //     haha: '我是参数中参数之dfg无敌sdf参数',
//                 //   );
//                 // }));
//               },
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class TipRoute extends StatelessWidget {
//   TipRoute({
//     Key key,
//     @required this.haha,
//   }) : super(key: key);
//   final Map haha;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('提示'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(18),
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               Text(haha['firstcanshu']),
//               RaisedButton(
//                 child: Text('返回'),
//                 onPressed: () => Navigator.pop(context, '我是返回值'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
