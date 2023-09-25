import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/bar_chart.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/card_item.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/filter_cart.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/line_chart.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<DashboardController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      body: controller.obx(
        (state) {
          return SizedBox(
            child: Column(
              children: [
                const FilterCartWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: BarChartWidget(
                        titleChart: 'Produto A',
                        maxY: 200000,
                        corBar: Colors.red.shade400,
                        priProdutoATri1:
                            controller.triProducts['priProdutoA']!['trim1']!,
                        priProdutoATri2:
                            controller.triProducts['segProdutoA']!['trim2']!,
                        priProdutoATri3:
                            controller.triProducts['terProdutoA']!['trim3']!,
                        priProdutoATri4:
                            controller.triProducts['quartProdutoA']!['trim4']!,
                      ),
                    ),
                    Expanded(
                      child: BarChartWidget(
                        titleChart: 'Produto B',
                        corBar: Colors.blue,
                        maxY: 300000,
                        priProdutoATri1:
                            controller.triProducts['priProdutoB']!['trim1']!,
                        priProdutoATri2:
                            controller.triProducts['segProdutoB']!['trim2']!,
                        priProdutoATri3:
                            controller.triProducts['terProdutoB']!['trim3']!,
                        priProdutoATri4:
                            controller.triProducts['quartProdutoB']!['trim4']!,
                      ),
                    ),
                    Expanded(
                      child: BarChartWidget(
                        titleChart: 'Produto C',
                        maxY: 400000,
                        corBar: Colors.orange,
                        priProdutoATri1:
                            controller.triProducts['priProdutoC']!['trim1']!,
                        priProdutoATri2:
                            controller.triProducts['segProdutoC']!['trim2']!,
                        priProdutoATri3:
                            controller.triProducts['terProdutoC']!['trim3']!,
                        priProdutoATri4:
                            controller.triProducts['quartProdutoC']!['trim4']!,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: PieChartWidget(data: controller.listData),
                    ),
                    const Expanded(
                      flex: 3,
                      child: LineChartWidget(),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        onError: (error) => Text('$error'),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
