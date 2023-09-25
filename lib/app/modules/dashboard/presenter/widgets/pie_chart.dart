import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';
import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/card_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChartWidget extends GetView<DashboardController> {
  final List<BasePraticaEntiti> data;

  const PieChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // int touchedIndex = -1;

    return CartItem(
      heightSize: 300,
      widthSize: 400,
      childWidget: GetBuilder<DashboardController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 3, bottom: 5),
                child: Text(
                  'Análise Geral',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          // pieTouchData: PieTouchData(touchCallback:
                          //     (FlTouchEvent event, pieTouchResponse) {
                          //   if (!event.isInterestedForInteractions ||
                          //       pieTouchResponse == null ||
                          //       pieTouchResponse.touchedSection == null) {
                          //     touchedIndex = -1;
                          //     return;
                          //   }
                          //   touchedIndex = pieTouchResponse
                          //       .touchedSection!.touchedSectionIndex;
                          // }),
                          sectionsSpace: 10,
                          // read about it in the PieChartData section
                          sections: [
                            PieChartSectionData(
                              title:
                                  '${controller.getTotalProduct(controller.dataProductA)}',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                decoration: TextDecoration.none,
                              ),
                              value: controller
                                  .getTotalProduct(controller.dataProductA),
                              color: Colors.red,
                            ),
                            PieChartSectionData(
                              title:
                                  '${controller.getTotalProduct(controller.dataProductB)}',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                decoration: TextDecoration.none,
                              ),
                              value: controller
                                  .getTotalProduct(controller.dataProductB),
                              color: Colors.blue,
                            ),
                            PieChartSectionData(
                              title:
                                  '${controller.getTotalProduct(controller.dataProductC)}',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              value: controller
                                  .getTotalProduct(controller.dataProductC),
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        swapAnimationDuration:
                            const Duration(milliseconds: 150), // Optional
                        swapAnimationCurve: Curves.linear, // Optional
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              controller.dataProductA[1].produto,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              controller.dataProductB[1].produto,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              controller.dataProductC[1].produto,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
