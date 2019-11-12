import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/smartDrawer.dart';

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
                        TextSpan(
                            text: '设备总数',
                            style: TextStyle(color: Color(0xFF7FFFFFFF))),
                        TextSpan(
                          text: '201',
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color(0xFFE5C195),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: ('(台)'),
                            style: TextStyle(color: Color(0xFF7FFFFFFF)))
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
                      style:
                          TextStyle(fontSize: 12, color: Color(0xFF7FFFFFFF)),
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
                            style: TextStyle(
                                color: Color(0xFFB2FFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
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
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF202736), width: 0.0)),
          color: const Color(0xFF202736), // 0xFF192134
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF192134),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                // todo 暂时没搞懂为什么这里的spaceBetween可以起作用
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 18.5, top: 6.5, bottom: 6.5),
                    child: Text(
                      '能耗统计',
                      style: TextStyle(color: Colors.white, fontSize: 14.5),
                    ),
                    height: 36,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(right: 18.5, top: 6.5, bottom: 6.5),
                    child: Icon(
                      Icons.arrow_forward,
                      color: const Color(0xFF98918f),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 18.5, right: 18.5, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '201.02',
                              style: TextStyle(
                                  color: const Color(0xFFE5C195),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              '当月能耗(W)',
                              style: TextStyle(
                                  color: Color(0xFF7FFFFFFF), fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '2000.02',
                              style: TextStyle(
                                  color: const Color(0xFFE5C195),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              '年度能耗(W)',
                              style: TextStyle(
                                color: Color(0xFF7FFFFFFF),
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            // todo 是否可以提取样式
                            child: Text(
                              '128.02',
                              style: TextStyle(
                                  color: const Color(0xFFE5C195),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              '供暖面积(m²)',
                              style: TextStyle(
                                  color: Color(0xFF7FFFFFFF), fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 18.5, right: 18.5),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '单位(W)',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF7FFFFFFF)),
                          )
                        ],
                      ),
                    ),
                    new LineChartSample4(),
                  ],
                ),
                // height: 122,
              )
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
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                    Container(
                      child: Image.asset('images/icon_shebei.png')
                    ),
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
                    Container(
                      child: Image.asset('images/icon_nenghao.png')
                    ),
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
                    Container(
                      child: Image.asset('images/icon_guanzhu.png')
                    ),
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

// todo改造成statefull组件
class LineChartSample4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // const cutOffYValue = 5.0;

    return SizedBox(
      width: MediaQuery.of(context).size.width - 37, // 总长度减去边距
      height: 160,
      child: LineChart(
        LineChartData(
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 4),
                FlSpot(1, 3.5),
                FlSpot(2, 4.5),
                FlSpot(3, 1),
                FlSpot(4, 4),
                FlSpot(5, 6),
                FlSpot(6, 6.5),
                FlSpot(7, 6),
                FlSpot(8, 4),
                FlSpot(9, 6),
                FlSpot(10, 6),
                FlSpot(11, 7),
              ],
              isCurved: false,
              barWidth: 2,
              colors: [
                const Color(0xFFE5C195),
              ],
              // belowBarData: BarAreaData(
              //   show: true,
              //   colors: [Colors.deepPurple.withOpacity(0.4)],
              //   cutOffY: cutOffYValue,
              //   applyCutOffY: true,
              // ),
              // aboveBarData: BarAreaData(
              //   show: true,
              //   colors: [Colors.orange.withOpacity(0.6)],
              //   cutOffY: cutOffYValue,
              //   applyCutOffY: true,
              // ),
              dotData: const FlDotData(
                  show: true, dotColor: const Color(0xFFE5C195)),
            ),
          ],
          minY: 0,
          borderData: FlBorderData(
            // border: Border.all(
            //     color: Colors.white, width: 1.0, style: BorderStyle.solid),
            border: Border(
              top: BorderSide(width: 0.0, color: Color(0xffF7aaaaaa)),
              left: BorderSide(width: 0.5, color: Color(0xffF7eeeeee)),
              right: BorderSide(width: 0.0, color: Colors.transparent),
              bottom: BorderSide(width: 0.5, color: Color(0xffF7eeeeee)),
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF7FFFFFFF),
                  // fontWeight: FontWeight.bold,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return '01';
                    case 1:
                      return '02';
                    case 2:
                      return '03';
                    case 3:
                      return '04';
                    case 4:
                      return '05';
                    case 5:
                      return '06';
                    case 6:
                      return '07';
                    case 7:
                      return '08';
                    case 8:
                      return '09';
                    case 9:
                      return '10';
                    case 10:
                      return '11';
                    case 11:
                      return '12';
                    default:
                      return '';
                  }
                }),
            leftTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                fontSize: 10,
                color: Color(0xFF7FFFFFFF),
                // fontWeight: FontWeight.bold,
              ),
              getTitles: (value) {
                return '${value + 0.5}';
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            getDrawingVerticalGridLine: (value) {
              return const FlLine(
                color: Color(0xFF7F232C3E),
                strokeWidth: 1,
              );
            },
            // checkToShowHorizontalGrid: (double value) {
            //   return value == 1 || value == 6 || value == 4 || value == 5;
            // },
          ),
        ),
      ),
    );
  }
}
