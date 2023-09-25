import 'package:dartz/dartz.dart';
import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';
import 'package:dashboard/app/modules/dashboard/domain/errors/errors.dart';

abstract class IDashboardGetDataRepository {
  Future<Either<NotDataException, List<BasePraticaEntiti>>> call(
      String searchText);
}
