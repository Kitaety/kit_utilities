import 'package:flutter/material.dart';

class ExchangeRatesLoader extends StatelessWidget {
  const ExchangeRatesLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
      ],
    );
  }
}
