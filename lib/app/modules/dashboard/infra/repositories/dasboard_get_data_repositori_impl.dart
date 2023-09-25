import 'package:dartz/dartz.dart';
import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';
import 'package:dashboard/app/modules/dashboard/domain/errors/errors.dart';
import 'package:dashboard/app/modules/dashboard/domain/repositories/dashboard_get_data_repository.dart';
import 'package:dashboard/app/modules/dashboard/infra/datasources/dashboard_get_data_datasource.dart';

class DashboardRepositoryImpl implements IDashboardGetDataRepository {
  final IDashboardDataSource _datasource;

  DashboardRepositoryImpl(this._datasource);

  @override
  Future<Either<NotDataException, List<BasePraticaEntiti>>> call(
      String searchText) async {
    try {
      return Right(await _datasource(searchText));
    } on NotDataException catch (e) {
      return Left(e);
    } on Exception {
      return Left(NotDataException('Erro ao buscar dados do json'));
    }
  }
}
