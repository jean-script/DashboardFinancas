import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/card_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineChartWidget extends GetView<DashboardController> {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CartItem(
      widthSize: 950,
      heightSize: 300,
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 2,
              bottom: 14,
            ),
            child: Text(
              'Faturamento e imposto',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          GetBuilder<DashboardController>(builder: (ctx) {
            return Expanded(
              child: LineChart(
                duration: const Duration(milliseconds: 150),
                LineChartData(
                  // maxY: 5000,
                  // baselineY: 300000,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                        color: const Color.fromARGB(245, 186, 193, 198)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            ColorTween(begin: Colors.blue, end: Colors.blue)
                                .lerp(0.2)!
                                .withOpacity(0.7),
                            ColorTween(begin: Colors.blue, end: Colors.blue)
                                .lerp(0.2)!
                                .withOpacity(0.7),
                          ],
                        ),
                      ),
                      isStrokeCapRound: true,
                      // gradient: const LinearGradient(
                      //   colors: [Colors.blue, Colors.red, Colors.amber],
                      // ),
                      color: Colors.white,
                      barWidth: 2,
                      spots: [
                        FlSpot(1, controller.totalMeses['totalJan']!),
                        FlSpot(2, controller.totalMeses['totalFev']!),
                        FlSpot(3, controller.totalMeses['totalMar']!),
                        FlSpot(4, controller.totalMeses['totalAbr']!),
                        FlSpot(5, controller.totalMeses['totalMai']!),
                        FlSpot(6, controller.totalMeses['totalJun']!),
                        FlSpot(7, controller.totalMeses['totalJul']!),
                        FlSpot(8, controller.totalMeses['totalAgo']!),
                        FlSpot(9, controller.totalMeses['totalSep']!),
                        FlSpot(10, controller.totalMeses['totalOut']!),
                        FlSpot(11, controller.totalMeses['totalNov']!),
                        FlSpot(12, controller.totalMeses['totalDez']!),
                      ],
                    )
                  ],
                  lineTouchData: const LineTouchData(enabled: true),
                  gridData: const FlGridData(
                      // getDrawingVerticalLine: (value) {
                      //   return const FlLine(
                      //     color: Colors.blue,
                      //   );
                      // },
                      // getDrawingHorizontalLine: (value) {
                      //   return const FlLine(
                      //     color: Colors.red,
                      //   );
                      // },
                      ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        reservedSize: 50,
                        interval: 8,
                        getTitlesWidget: leftTitleWidgets,
                      ),
                    ),
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );
    Widget text;

    return text = Text(meta.formattedValue, style: style);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('JAN', style: style);
        break;
      case 2:
        text = const Text('FEV', style: style);
        break;
      case 3:
        text = const Text('MAR', style: style);
        break;
      case 4:
        text = const Text('ABR', style: style);
        break;
      case 5:
        text = const Text('MAI', style: style);
        break;
      case 6:
        text = const Text('JUN', style: style);
        break;
      case 7:
        text = const Text('JUL', style: style);
        break;
      case 8:
        text = const Text('AGO', style: style);
        break;
      case 9:
        text = const Text('SEP', style: style);
        break;
      case 10:
        text = const Text('OUT', style: style);
        break;
      case 11:
        text = const Text('NOV', style: style);
        break;
      case 12:
        text = const Text('DEZ', style: style);
        break;
      default:
        text = Text(meta.formattedValue, style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
