import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kit_utilities/widgets/pages/utilitiesPage/utility_icon.dart';

class UtilitiesPage extends StatefulWidget {
  const UtilitiesPage({Key? key}) : super(key: key);

  @override
  State<UtilitiesPage> createState() => _UtilitiesPageState();
}

class _UtilitiesPageState extends State<UtilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(
        size: 100.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UtilityIcon(
                  icon: Icons.attach_money_rounded,
                  label: 'Exchange Rates',
                  onPressed: () => {
                    log(
                      'test',
                      time: DateTime.now(),
                    )
                  },
                  color: Colors.yellow,
                ),
                UtilityIcon(
                  icon: Icons.access_alarm,
                  label: 'Alarm',
                  onPressed: () => {
                    log(
                      'test',
                      time: DateTime.now(),
                    )
                  },
                  color: Colors.red,
                ),
                UtilityIcon(
                  icon: Icons.account_circle,
                  label: 'Account',
                  onPressed: () => {
                    log(
                      'test',
                      time: DateTime.now(),
                    )
                  },
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
