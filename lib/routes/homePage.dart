import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页'), 
        centerTitle: true),
        drawer: new MyDrawer());
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // mediaQuery是干什么的
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 38.0), child: Text('哈哈哈'))
            ],
          )),
    );
  }
}
