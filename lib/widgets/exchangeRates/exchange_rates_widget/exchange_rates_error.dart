import 'package:flutter/material.dart';

class ExchangeRatesError extends StatelessWidget {
  final Function reload;
  const ExchangeRatesError({Key? key, required this.reload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Error'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              reload();
            },
            child: const Text('RELOAD'))
      ],
    );
  }
}
