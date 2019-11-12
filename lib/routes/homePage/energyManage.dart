import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
