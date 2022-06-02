import 'package:flutter/material.dart';
import 'package:kit_utilities/blocs/bloc/exchange_rates_bloc.dart';
import 'package:kit_utilities/blocs/cubit/preferences_cubit.dart';
import 'package:kit_utilities/blocs/states/preferences_state.dart';
import 'package:kit_utilities/widgets/app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferencesCubit>(create: (_) => PreferencesCubit()),
        Provider<ExchangeRatesBloc>(create: (_) => ExchangeRatesBloc()),
      ],
      child: Builder(builder: (context) {
        PreferencesCubit cubit = Provider.of<PreferencesCubit>(context);
        return StreamBuilder<PreferencesState>(
          initialData: cubit.state,
          stream: cubit.stream,
          builder: (context, snapshot) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: snapshot.data!.theme,
            home: const App(),
          ),
        );
      }),
    );
  }
}
