import 'package:flutter/material.dart';
import 'package:kit_utilities/widgets/pages/homePage.dart';
import 'package:kit_utilities/widgets/pages/utilitesPage.dart';

class PageSelector extends StatelessWidget {
  const PageSelector({Key? key}) : super(key: key);
  static const pages = [HomePage(), UtilitiesPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const TabBarView(children: pages),
                ),
              ),
              const TabPageSelector(
                indicatorSize: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
