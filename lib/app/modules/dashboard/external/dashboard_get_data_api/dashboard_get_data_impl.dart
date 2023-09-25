import 'dart:convert';
import 'dart:io';

import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';
import 'package:dashboard/app/modules/dashboard/domain/errors/errors.dart';
import 'package:dashboard/app/modules/dashboard/infra/datasources/dashboard_get_data_datasource.dart';
import 'package:dashboard/app/modules/dashboard/infra/models/result_dashboard_data_model.dart';

class DashboardGetDataApi implements IDashboardDataSource {
  @override
  Future<List<BasePraticaEntiti>> call(String searchText) async {
    final dir = Directory.current;

    final file = File('${dir.path}/config.json');

    final text = await file.readAsString();

    if (text.isEmpty) {
      throw NotDataException('Sem dados');
    }

    var data = json.decode(text);

    data = data['BasePratica'];

    final list = (data as List)
        .map((e) => ResultDashboardDataMapper.fromMap(e))
        .toList();

    await Future.delayed(const Duration(seconds: 5));

    return list;
  }
}
