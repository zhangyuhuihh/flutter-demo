import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('智能供暖'), centerTitle: true),
      drawer: new MyDrawer(),
      body: Column(
        children: <Widget>[new DeviceManage(), new EnergyManage()],
      ),
    );
  }
}

class DeviceManage extends StatefulWidget {
  @override
  _DeviceManage createState() => _DeviceManage();
}

class _DeviceManage extends State<DeviceManage> {
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text('设备统计'),
                    height: 30,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.green,
                    ),
                    height: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EnergyManage extends StatefulWidget {
  @override
  _EnergyManage createState() => _EnergyManage();
}

class _EnergyManage extends State<EnergyManage> {
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Text('能耗统计'),
          ],
        ),
      ),
    );
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
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Text('当前登录账号')),
              Divider(
                height: 5.0,
              ),
              new MenuList()
            ],
          )),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.flash_on,
                color: Colors.green,
              ),
              Text('设备统计'),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.flash_on,
                color: Colors.green,
              ),
              Text('能耗统计'),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.grade, color: Colors.green),
              Text('设备统计'),
            ],
          ),
        )
      ],
    );
  }
}
