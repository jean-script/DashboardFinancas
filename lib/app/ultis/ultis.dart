import 'package:intl/intl.dart';

double priceToCurrency(double price) {
  NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

  return double.parse(numberFormat.format(price));
}
