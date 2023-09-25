import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:dashboard/app/modules/dashboard/presenter/widgets/card_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FilterCartWidget extends GetView<DashboardController> {
  const FilterCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CartItem(
      widthSize: double.infinity,
      heightSize: 70,
      childWidget: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Filtros',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                // filtro produdo
                Obx(() {
                  return DropdownButton<String>(
                    dropdownColor: Colors.amber,
                    value: controller.dropdownValueProduct.value,
                    onChanged: (String? value) {
                      controller.dropdownValueProduct.value = value!;
                      controller.filterData();
                    },
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    items: controller.listProducts
                        .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
                const SizedBox(width: 20),

                // filtro ano
                Obx(() {
                  return DropdownButton<int>(
                    dropdownColor: Colors.amber,
                    value: controller.dropdownValueYear.value,
                    onChanged: (int? value) {
                      controller.dropdownValueYear.value = value!;
                      controller.filterData();
                    },
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    items: controller.list
                        .map<DropdownMenuItem<int>>(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              '$value',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
