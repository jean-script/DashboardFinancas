import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/card_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarChartWidget extends GetView<DashboardController> {
  final String titleChart;
  final double priProdutoATri1;
  final double priProdutoATri2;
  final double priProdutoATri3;
  final double priProdutoATri4;
  final double? maxY;
  final Color corBar;

  const BarChartWidget({
    super.key,
    required this.titleChart,
    required this.priProdutoATri2,
    required this.priProdutoATri3,
    required this.priProdutoATri1,
    required this.priProdutoATri4,
    this.maxY,
    required this.corBar,
  });

  @override
  Widget build(BuildContext context) {
    return CartItem(
        heightSize: 300,
        widthSize: 450,
        childWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3, bottom: 10),
              child: Text(
                titleChart,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<DashboardController>(
                builder: (ctx) {
                  return BarChart(
                    BarChartData(
                      titlesData: titlesData,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              rod.toY.round().toString(),
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                          tooltipBgColor: Colors.transparent,
                          tooltipPadding: EdgeInsets.zero,
                          tooltipMargin: 1,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                            color: const Color.fromARGB(245, 186, 193, 198)),
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 1,
                          showingTooltipIndicators: [0],
                          barRods: [
                            BarChartRodData(
                              toY: priProdutoATri1,
                              width: 25,
                              borderRadius: const BorderRadius.all(Radius.zero),
                              color: corBar,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          showingTooltipIndicators: [0],
                          barRods: [
                            BarChartRodData(
                              toY: priProdutoATri2,
                              width: 25,
                              borderRadius: const BorderRadius.all(Radius.zero),
                              color: corBar,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          showingTooltipIndicators: [0],
                          barRods: [
                            BarChartRodData(
                              toY: priProdutoATri3,
                              width: 25,
                              borderRadius: const BorderRadius.all(Radius.zero),
                              color: corBar,
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          showingTooltipIndicators: [0],
                          barRods: [
                            BarChartRodData(
                              toY: priProdutoATri4,
                              width: 25,
                              borderRadius: const BorderRadius.all(Radius.zero),
                              color: corBar,
                            ),
                          ],
                        ),
                      ],
                      baselineY: 500,
                      minY: 500,
                      maxY: maxY,
                      gridData: const FlGridData(show: false),
                      alignment: BarChartAlignment.spaceAround,
                    ),
                    swapAnimationDuration:
                        const Duration(milliseconds: 420), // Optional
                    swapAnimationCurve: Curves.linear,
                  );
                },
              ),
            ),
          ],
        ));
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true, reservedSize: 50, getTitlesWidget: getTitles),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 14,
    );

    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Trim1';
        break;
      case 2:
        text = 'Trim2';
        break;
      case 3:
        text = 'Trim3';
        break;
      case 4:
        text = 'Trim4';
        break;
      default:
        text = meta.formattedValue;
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}
