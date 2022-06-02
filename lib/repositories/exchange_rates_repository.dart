import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:kit_utilities/models/rates.dart';

class ExchangeRatesRepository {
  Future<Map<String, List<double>>> getRates(
      List<int> currencyIds, DateTime startDate, DateTime endDate) async {
    Map<String, List<double>> rates = {};
    int countDay = endDate.difference(startDate).inDays;

    for (int currencyId in currencyIds) {
      for (var i = 0; i <= countDay; i++) {
        Rates rate = await _getRatesByCurrencyCodeOnDate(
            currencyId, startDate.add(Duration(days: i)));
        String key = rate.abbreviation;

        if (!rates.containsKey(key)) {
          rates[key] = [];
        }

        rates[key]!.add(rate.officialRate);
      }
    }

    return rates;
  }

  Future<Rates> _getRatesByCurrencyCodeOnDate(
      int currencyCode, DateTime date) async {
    Response response = await Dio().get(
        'https://www.nbrb.by/api/exrates/rates/$currencyCode',
        queryParameters: {
          'ondate': DateFormat('yyyy-MM-dd').format(date),
        });
    return Rates.fromMap(response.data!);
  }
}
