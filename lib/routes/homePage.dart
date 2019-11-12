import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('智能供暖'),
          centerTitle: true,
          backgroundColor: const Color(0xFF192134)),
      drawer: new MyDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF192134),
              border: Border(
                bottom: BorderSide(color: Color(0xFF192134), width: 0.0),
              ),
            ),
            padding: EdgeInsets.only(left: 16.5),
            height: 50,
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.show_chart,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Text(
                    '设备及能耗统计',
                    style: TextStyle(fontSize: 14.5, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // 这里是container,会占据最大空间,详情见官网
          new DeviceManage(),
          new EnergyManage()
        ],
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
    return Container(
      height: 270,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF192134), width: 0.0)),
        color: const Color(0xFF192134), // 0xFF192134
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF202736),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 18.5, top: 6.5, bottom: 6.5, right: 18.5),
                    child: Text(
                      '设备统计',
                      style: TextStyle(color: Colors.white, fontSize: 14.5),
                    ),
                    height: 36,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 18.5),
                    child: Icon(
                      Icons.arrow_forward,
                      color: const Color(0xFF98918f),
                    ),
                    height: 36,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 18.5, top: 5.0, right: 18.5),
                  child: Text.rich(TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      children: [
                        TextSpan(text: '设备总数'),
                        TextSpan(
                            text: '201',
                            style: TextStyle(
                                fontSize: 16, color: const Color(0xFFE5C195))),
                        TextSpan(text: ('(台)'))
                      ])),
                ),
              ],
            ),
            new DeviceSitutation()
          ],
        ),
      ),
    );
  }
}

class DeviceSitutation extends StatefulWidget {
  @override
  _DeviceSitutation createState() => _DeviceSitutation();
}

class _DeviceSitutation extends State<DeviceSitutation> {
  List<Map> situtationsList;

  initState() {
    super.initState();
    situtationsList = [
      {'title': '在线总数', 'value': 190},
      {'title': '离线数量', 'value': 11},
      {'title': '工作中数量', 'value': 160},
      {'title': '休息中数量', 'value': 30}
    ];
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: situtationsList.map((item) {
          return Row(
            // 由于是column中嵌套row，所以内部已经不是最大宽度了，想要最大宽度必须手动使用Expanded包裹
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      item['title'],
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // 神器的宽度问题，解决一系列内部宽度问题,抛开正统布局宽度继承因素，曲线救国
                    padding: EdgeInsets.only(left: 18.5, top: 4, right: 18.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(3.0),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF1A3269),
                                const Color(0xFFE5C298)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            item['value'].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
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
        color: const Color(0xFF192134),
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
