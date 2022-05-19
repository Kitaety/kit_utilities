import 'package:flutter/material.dart';
import 'package:kit_utilities/widgets/pageSelector.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: null,
        body: PageSelector(),
      ),
    );
  }
}
