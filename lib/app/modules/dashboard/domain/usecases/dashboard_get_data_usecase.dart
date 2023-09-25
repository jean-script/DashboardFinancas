import 'package:dartz/dartz.dart';
import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';
import 'package:dashboard/app/modules/dashboard/domain/repositories/dashboard_get_data_repository.dart';
import 'package:dashboard/app/modules/dashboard/domain/errors/errors.dart';

abstract class IDashboardGetDataUsecase {
  Future<Either<NotDataException, List<BasePraticaEntiti>>> call(
      String searchText);
}

class DashboardGetDataUseCase implements IDashboardGetDataUsecase {
  final IDashboardGetDataRepository repository;

  DashboardGetDataUseCase(this.repository);

  @override
  Future<Either<NotDataException, List<BasePraticaEntiti>>> call(
      String searchText) async {
    if (searchText.isEmpty) {
      return Left(NotDataException('O searcText não pode estar vazio'));
    }

    return repository(searchText);
  }
}
