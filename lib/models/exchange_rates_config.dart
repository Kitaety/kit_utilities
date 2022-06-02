import 'package:flutter/foundation.dart';

class ExchangeRatesConfig {
  final List<int> currencyIds;
  ExchangeRatesConfig({
    required this.currencyIds,
  });

  ExchangeRatesConfig copyWith({
    List<int>? currencyIds,
  }) {
    return ExchangeRatesConfig(
      currencyIds: currencyIds ?? this.currencyIds,
    );
  }

  @override
  String toString() => 'ExchangeRatesConfig(currencyIds: $currencyIds)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExchangeRatesConfig &&
        listEquals(other.currencyIds, currencyIds);
  }

  @override
  int get hashCode => currencyIds.hashCode;
}
