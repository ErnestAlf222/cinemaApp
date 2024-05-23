import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class HumanFormats {

  static String number(double number, [ int decimals = 0 ]) {
    
    final formattedNumber =  NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formattedNumber;
  }

  static String formatearFecha(DateTime fecha)  {
  initializeDateFormatting('es_MX');
  final formato = DateFormat.yMMMd('es_MX');
  final fechaFormateada = formato.format(fecha);
  return fechaFormateada;
}
}

