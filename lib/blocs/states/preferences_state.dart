import 'package:flutter/material.dart';

class PreferencesState {
  final ThemeMode theme;

  PreferencesState({
    required this.theme,
  });

  PreferencesState copyWith({
    ThemeMode? theme,
  }) {
    return PreferencesState(
      theme: theme ?? this.theme,
    );
  }

  @override
  String toString() => 'PageSelector(currentPage: $theme)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreferencesState && other.theme == theme;
  }

  @override
  int get hashCode => theme.hashCode;
}
