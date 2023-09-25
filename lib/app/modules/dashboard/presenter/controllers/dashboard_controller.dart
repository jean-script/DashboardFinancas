import 'package:dashboard/app/modules/dashboard/domain/entities/base_pratica_entities.dart';
import 'package:dashboard/app/modules/dashboard/domain/usecases/dashboard_get_data_usecase.dart';
import 'package:dashboard/app/ultis/ultis.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with StateMixin<List<BasePraticaEntiti>> {
  final IDashboardGetDataUsecase _dataUsecase;

  // todos os dados
  late List<BasePraticaEntiti> listData = [];

  // filter
  final List<int> list = [2018, 2019, 2020];
  final List<String> listProducts = ['Produto A', 'Produto B', 'Produto C'];
  late RxInt dropdownValueYear = list.first.obs;
  late RxString dropdownValueProduct = listProducts.first.obs;

  // listas com os dados de cada produtos
  List<BasePraticaEntiti> dataProductA = [];
  List<BasePraticaEntiti> dataProductB = [];
  List<BasePraticaEntiti> dataProductC = [];

  // lista dos trimestres
  Map<String, Map<String, double>> triProducts = {};
  Map<String, double> totalMeses = {};

  DashboardController(this._dataUsecase);

  @override
  void onInit() async {
    super.onInit();

    await getData('all');
  }

  void handleChangeYear(int? value) {
    dropdownValueYear.value = value!;
  }

  List<BasePraticaEntiti> getProductList(
      List<BasePraticaEntiti> dados, String search, num ano) {
    var data = dados
        .where(
          (element) => element.produto == search,
        )
        .toList()
        .where((element) => element.data.year.isEqual(ano))
        .toList();

    return data;
  }

  double getTotalProduct(List<BasePraticaEntiti> list) {
    double total = 0;
    for (var item in list) {
      total += item.preco;
    }

    return total;
  }

  double getDataTotalMes(int mes, List<BasePraticaEntiti> list) {
    List<BasePraticaEntiti> data = list
        .where((element) => element.produto == dropdownValueProduct.value)
        .toList()
        .where((element) => element.data.year.isEqual(dropdownValueYear.value))
        .where((element) => element.data.month.isEqual(mes))
        .toList();

    return getTotalProduct(data);
  }

  Map<String, double> getDataTrimestri(
      List<BasePraticaEntiti> list, int trimestre) {
    Map<String, double> map = {};
    switch (trimestre) {
      case 1:
        List<BasePraticaEntiti> data = list
            .where((element) =>
                element.data.month.isEqual(03) ||
                element.data.month.isEqual(02) ||
                element.data.month.isEqual(01))
            .toList();
        return map = {'trim1': getTotalProduct(data)};

      case 2:
        List<BasePraticaEntiti> data = list
            .where((element) =>
                element.data.month.isEqual(06) ||
                element.data.month.isEqual(05) ||
                element.data.month.isEqual(04))
            .toList();
        return map = {'trim2': getTotalProduct(data)};
      case 3:
        List<BasePraticaEntiti> data = list
            .where((element) =>
                element.data.month.isEqual(09) ||
                element.data.month.isEqual(08) ||
                element.data.month.isEqual(07))
            .toList();
        return map = {'trim3': getTotalProduct(data)};
      case 4:
        List<BasePraticaEntiti> data = list
            .where((element) =>
                element.data.month.isEqual(12) ||
                element.data.month.isEqual(11) ||
                element.data.month.isEqual(10))
            .toList();
        return map = {'trim4': getTotalProduct(data)};

      default:
        return map;
    }
  }

  Future getData(String searchText) async {
    change([], status: RxStatus.loading());
    final results = await _dataUsecase(searchText);

    results.fold((l) {
      change([], status: RxStatus.error());
    }, (r) {
      listData = r;
      change(listData, status: RxStatus.success());

      filterData();
    });

    update();
  }

  void filterData() {
    // obtendo lista de produtos
    dataProductA =
        getProductList(listData, 'Produto A', dropdownValueYear.value);
    dataProductB =
        getProductList(listData, 'Produto B', dropdownValueYear.value);
    dataProductC =
        getProductList(listData, 'Produto C', dropdownValueYear.value);
    // obtendo dados por trimestres
    // produto a
    triProducts['priProdutoA'] = getDataTrimestri(dataProductA, 1);
    triProducts['segProdutoA'] = getDataTrimestri(dataProductA, 2);
    triProducts['terProdutoA'] = getDataTrimestri(dataProductA, 3);
    triProducts['quartProdutoA'] = getDataTrimestri(dataProductA, 4);
    // produto b
    triProducts['priProdutoB'] = getDataTrimestri(dataProductB, 1);
    triProducts['segProdutoB'] = getDataTrimestri(dataProductB, 2);
    triProducts['terProdutoB'] = getDataTrimestri(dataProductB, 3);
    triProducts['quartProdutoB'] = getDataTrimestri(dataProductB, 4);
    // produto C
    triProducts['priProdutoC'] = getDataTrimestri(dataProductC, 1);
    triProducts['segProdutoC'] = getDataTrimestri(dataProductC, 2);
    triProducts['terProdutoC'] = getDataTrimestri(dataProductC, 3);
    triProducts['quartProdutoC'] = getDataTrimestri(dataProductC, 4);

    // total de cada mes

    totalMeses['totalJan'] = getDataTotalMes(1, listData);
    totalMeses['totalFev'] = getDataTotalMes(2, listData);
    totalMeses['totalMar'] = getDataTotalMes(3, listData);
    totalMeses['totalAbr'] = getDataTotalMes(4, listData);
    totalMeses['totalMai'] = getDataTotalMes(5, listData);
    totalMeses['totalJun'] = getDataTotalMes(6, listData);
    totalMeses['totalJul'] = getDataTotalMes(7, listData);
    totalMeses['totalAgo'] = getDataTotalMes(8, listData);
    totalMeses['totalSep'] = getDataTotalMes(9, listData);
    totalMeses['totalOut'] = getDataTotalMes(10, listData);
    totalMeses['totalNov'] = getDataTotalMes(11, listData);
    totalMeses['totalDez'] = getDataTotalMes(12, listData);

    update();
  }
}
