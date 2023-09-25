import 'package:dashboard/app/modules/dashboard/domain/repositories/dashboard_get_data_repository.dart';
import 'package:dashboard/app/modules/dashboard/domain/usecases/dashboard_get_data_usecase.dart';
import 'package:dashboard/app/modules/dashboard/external/dashboard_get_data_api/dashboard_get_data_impl.dart';
import 'package:dashboard/app/modules/dashboard/infra/datasources/dashboard_get_data_datasource.dart';
import 'package:dashboard/app/modules/dashboard/infra/repositories/dasboard_get_data_repositori_impl.dart';
import 'package:dashboard/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // use case
    Get.lazyPut<IDashboardDataSource>(() => DashboardGetDataApi());
    Get.lazyPut<IDashboardGetDataRepository>(
        () => DashboardRepositoryImpl(Get.find()));
    Get.lazyPut<IDashboardGetDataUsecase>(
        () => DashboardGetDataUseCase(Get.find()));

    // Controller
    Get.lazyPut(() => DashboardController(Get.find()));
  }
}
