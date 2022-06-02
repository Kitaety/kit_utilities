import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kit_utilities/blocs/states/preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesState(theme: ThemeMode.system));

  void changeTheme(ThemeMode theme) {
    emit(state.copyWith(theme: theme));
  }
}
