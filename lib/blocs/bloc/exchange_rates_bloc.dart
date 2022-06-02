import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:kit_utilities/blocs/states/exchange_retes_state.dart';
import 'package:kit_utilities/blocs/event/exchange_rates_event.dart';
import 'package:kit_utilities/models/exchange_rates_config.dart';
import 'package:kit_utilities/repositories/exchange_rates_repository.dart';

class ExchangeRatesBloc extends Bloc<ExchangeRatesEvent, ExchangeRatesState> {
  final ExchangeRatesRepository repository = ExchangeRatesRepository();

  ExchangeRatesBloc()
      : super(ExchangeRatesState(
          config: ExchangeRatesConfig(
            currencyIds: [431, 451, 456], //431 - USD, 451 - EUR, 456 - RUB
          ),
          rates: {},
          startDate: DateTime.now().add(const Duration(days: -6)),
          endDate: DateTime.now(),
          isLoad: true,
          isError: false,
        )) {
    on<ExchangeRatesLoadEvent>((event, emit) async {
      try {
        emit(state.copyWith(
          isLoad: true,
          isError: null,
          rates: {},
        ));

        Map<String, List<double>> rates = await repository.getRates(
            state.config.currencyIds, state.startDate, state.endDate);

        emit(state.copyWith(
          isLoad: false,
          isError: false,
          rates: rates,
        ));
      } catch (ex, stackTrace) {
        log(
          ex.toString(),
          time: DateTime.now(),
          error: ex,
          stackTrace: stackTrace,
        );
        emit(state.copyWith(
          isLoad: false,
          isError: true,
          rates: null,
        ));
      }
    });
    add(ExchangeRatesLoadEvent());
  }
}
