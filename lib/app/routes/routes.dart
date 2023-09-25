import 'package:dashboard/app/pages/Home/home_screen.dart';
import 'package:get/get.dart';

abstract class MyRoutes {
  static String home = '/';

  static final pages = <GetPage>[
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
  ];
}
