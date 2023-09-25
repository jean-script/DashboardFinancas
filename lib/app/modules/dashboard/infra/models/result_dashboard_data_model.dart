import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';

class ResultDashboardDataMapper extends BasePraticaEntiti {
  ResultDashboardDataMapper(
      {required super.produto,
      required super.preco,
      required super.pgto,
      required super.nParcelas,
      required super.data,
      required super.cliente,
      required super.email,
      required super.ddd,
      required super.telefone});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produto': produto,
      'preco': preco,
      'pgto': pgto,
      'nParcelas': nParcelas,
      'data': data,
      'cliente': cliente,
      'email': email,
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  factory ResultDashboardDataMapper.fromMap(Map<String, dynamic> map) {
    return ResultDashboardDataMapper(
        produto: map['Produto'],
        preco: map['Preço'],
        pgto: map['Pgto.'],
        nParcelas: map['Nº Parcelas'],
        data: DateTime.parse(map['Data']),
        cliente: map['Cliente'],
        email: map['E-mail'],
        ddd: map['DDD'],
        telefone: map['Telefone']);
  }
}
