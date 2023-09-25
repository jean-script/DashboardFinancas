import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';

abstract class IDashboardDataSource {
  Future<List<BasePraticaEntiti>> call(String searchText);
}
