import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/smartDrawer.dart';
import './deviceManage.dart';
import './energyManage.dart';

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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
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
                    Container(child: Image.asset('images/tongjifenxi.png')),
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
    return SmartDrawer(
      widthPercent: 0.46,
      // mediaQuery是干什么的
      child: MediaQuery.removePadding(
        context: context,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.0),
            color: Color(0xFF1A2234),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 63),
                child: Container(
                  width: 85,
                  height: 85,
                  color: Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 14, bottom: 20),
                child: Text(
                  '当前登录账号',
                  style: TextStyle(color: Color(0xFFE5FFFFFF)),
                ),
              ),
              Container(
                height: 5.0,
                color: Color(0xFF101725),
              ),
              new MenuList(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: FlatButton(
                        padding: EdgeInsets.only(left: 23, right: 23),
                        color: Color(0xFFE5C195),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text('退出登录'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Row(
                  children: <Widget>[
                    Container(child: Image.asset('images/icon_shebei.png')),
                    Container(
                      margin: EdgeInsets.only(left: 5.5),
                      child: Text(
                        '设备统计',
                        style: TextStyle(color: Color(0xFFB2FFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 9),
                child: Icon(
                  Icons.arrow_forward,
                  color: const Color(0xFFB2FFFFFF),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Row(
                  children: <Widget>[
                    Container(child: Image.asset('images/icon_nenghao.png')),
                    Container(
                      margin: EdgeInsets.only(left: 5.5),
                      child: Text(
                        '能耗统计',
                        style: TextStyle(color: Color(0xFFB2FFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 9),
                child: Icon(
                  Icons.arrow_forward,
                  color: const Color(0xFFB2FFFFFF),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Row(
                  children: <Widget>[
                    Container(child: Image.asset('images/icon_guanzhu.png')),
                    Container(
                      margin: EdgeInsets.only(left: 5.5),
                      child: Text(
                        '我的关注',
                        style: TextStyle(color: Color(0xFFB2FFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, right: 9),
                child: Icon(
                  Icons.arrow_forward,
                  color: const Color(0xFFB2FFFFFF),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
