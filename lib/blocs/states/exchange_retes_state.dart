import 'package:flutter/foundation.dart';
import 'package:kit_utilities/models/exchange_rates_config.dart';

class ExchangeRatesState {
  final ExchangeRatesConfig config;
  final Map<String, List<double>> rates;
  final DateTime startDate;
  final DateTime endDate;
  final bool isLoad;
  final bool isError;

  ExchangeRatesState(
      {required this.config,
      required this.rates,
      required this.startDate,
      required this.endDate,
      required this.isLoad,
      required this.isError});

  ExchangeRatesState copyWith(
      {ExchangeRatesConfig? config,
      Map<String, List<double>>? rates,
      DateTime? startDate,
      DateTime? endDate,
      bool? isLoad,
      bool? isError}) {
    return ExchangeRatesState(
      config: config ?? this.config,
      rates: rates ?? this.rates,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isLoad: isLoad ?? this.isLoad,
      isError: isError ?? this.isError,
    );
  }

  @override
  String toString() =>
      'ExchangeRatesState(rates: $rates, startDate: $startDate, endDate: $endDate, isLoad: $isLoad, error: $isError, config: $config)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExchangeRatesState &&
        mapEquals(other.rates, rates) &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isLoad == isLoad &&
        other.isError == isError &&
        other.config == config;
  }

  @override
  int get hashCode =>
      rates.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      isLoad.hashCode ^
      isError.hashCode ^
      config.hashCode;
}
