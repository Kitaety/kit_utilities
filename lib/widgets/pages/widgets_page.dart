import 'package:flutter/material.dart';
import 'package:kit_utilities/blocs/cubit/preferences_cubit.dart';
import 'package:kit_utilities/widgets/exchangeRates/exchange_rates_widget.dart';
import 'package:provider/provider.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        ExchangeRatesWidget(),
        Consumer<PreferencesCubit>(
          builder: (context, value, child) => Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dark Theme'),
                  Switch(
                    value: isDark,
                    onChanged: (isDark) {
                      value.changeTheme(
                          isDark ? ThemeMode.dark : ThemeMode.light);
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
