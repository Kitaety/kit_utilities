import 'package:flutter/material.dart';
import 'package:kit_utilities/blocs/bloc/exchange_rates_bloc.dart';
import 'package:kit_utilities/blocs/states/exchange_retes_state.dart';
import 'package:kit_utilities/blocs/event/exchange_rates_event.dart';
import 'package:kit_utilities/widgets/exchangeRates/exchange_rates_widget/exchange_rates_error.dart';
import 'package:kit_utilities/widgets/exchangeRates/exchange_rates_widget/exchange_rates_loader.dart';
import 'package:kit_utilities/widgets/exchangeRates/exchange_rates_widget/exchange_rates_success.dart';
import 'package:provider/provider.dart';

class ExchangeRatesWidget extends StatelessWidget {
  const ExchangeRatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExchangeRatesBloc bloc = Provider.of<ExchangeRatesBloc>(context);

    return StreamBuilder<ExchangeRatesState>(
        stream: bloc.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 300.0,
                child: Builder(
                  builder: (context) {
                    ExchangeRatesState? state = snapshot.data;
                    if (state == null || state.isLoad) {
                      return const ExchangeRatesLoader();
                    }
                    if (state.isError) {
                      return ExchangeRatesError(reload: () {
                        bloc.add(ExchangeRatesLoadEvent());
                      });
                    }

                    return ExhangeRatesSuccess(
                      state: state,
                      reload: () {
                        bloc.add(ExchangeRatesLoadEvent());
                      },
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
