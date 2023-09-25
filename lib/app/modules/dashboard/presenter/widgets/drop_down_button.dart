// import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class DropDownButtonWidget extends GetView<DashboardController> {

//   final 
//   const DropDownButtonWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       dropdownColor: Colors.amber,
//       value: controller.dropdownValue.value,
//       onChanged: (int? value) {
//         controller.dropdownValue.value = value!;
//         controller.filterData();
//       },
//       style: const TextStyle(
//         fontSize: 18,
//         color: Colors.white,
//       ),
//       items: controller.list
//           .map<DropdownMenuItem<int>>(
//             (value) => DropdownMenuItem(
//               value: value,
//               child: Text(
//                 '$value',
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }
