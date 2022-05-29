import 'package:flutter/material.dart';
import 'package:kit_utilities/widgets/page_selector.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: SafeArea(
        child: PageSelector(),
      ),
    );
  }
}
